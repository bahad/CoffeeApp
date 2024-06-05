import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/core/constants/app_borders.dart';
import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/features/home/home_controller.dart';
import 'package:coffeeapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class BuildGrid extends StatelessWidget {
  const BuildGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        if (homeController.coffeeModel == null || homeController.coffeeModel?.isEmpty == true) {
          return const SizedBox();
        } else {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Scrollbar(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: homeController.coffeeModel?.length,
                  itemBuilder: (context, index) {
                    return GridItem(
                      coffeeModel: homeController.coffeeModel?[index],
                    );
                  },
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final CoffeeModel? coffeeModel;
  const GridItem({super.key, this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.detail,
        arguments: coffeeModel,
      ),
      child: ClipRRect(
        borderRadius: AppBorderRadius.small,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: AppBorderRadius.small,
            color: AppColors.containerWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125.h,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: AppBorderRadius.small,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: AppBorderRadius.small,
                      child: CachedNetworkImage(
                        imageUrl: coffeeModel?.image ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 24.w,
                            color: AppColors.starYellow,
                          ),
                          Text(
                            "4.5",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
                          ).paddingOnly(left: 12)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(coffeeModel?.title ?? "", style: Theme.of(context).textTheme.titleSmall)
                  .paddingOnly(top: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "€ ${coffeeModel?.price ?? ""}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.price,
                        ),
                  ),
                  const SizedBox(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      borderRadius: AppBorderRadius.small,
                      color: AppColors.button,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 24.w,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ).paddingOnly(top: 8),
            ],
          ),
        ),
      ),
    );
  }
}
