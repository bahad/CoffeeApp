import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/core/constants/app_borders.dart';
import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/features/detail/detail_controller.dart';
import 'package:coffeeapp/global_widgets/kbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import 'widgets/build_size.dart';

class DetailScreen extends StatelessWidget {
  final CoffeeModel? coffeeModel;
  const DetailScreen({super.key, this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    if (coffeeModel == null) {
      return const SizedBox();
    } else {
      return Scaffold(
        backgroundColor: AppColors.containerWhite,
        bottomSheet: Container(
          height: 90.h,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.price),
                    ),
                    Text(
                      "€ ${coffeeModel?.price ?? ""}",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.button),
                    ),
                  ],
                ),
                const SizedBox(),
                Flexible(
                  child: KButton(
                    text: 'Buy Now',
                    color: AppColors.button,
                    textStyle: const TextStyle(
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ).paddingOnly(left: 50.w),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.containerWhite,
          title: Text(
            'Detail',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 24.w,
              ),
            )
          ],
        ),
        body: GetBuilder<DetailController>(
          init: DetailController(),
          builder: (detailController) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: AppBorderRadius.medium,
                      child: CachedNetworkImage(
                        imageUrl: coffeeModel?.image ?? "",
                        height: 190.w,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              coffeeModel?.title ?? "",
                              style: Theme.of(context).textTheme.titleMedium,
                            ).paddingOnly(top: 12.w, bottom: 1.w),
                            Text(
                              "with chocolate",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.gray),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.starYellow,
                                  size: 24.w,
                                ),
                                Text(
                                  "4.8",
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: AppColors.dark,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  " (230)",
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                        color: AppColors.gray,
                                      ),
                                )
                              ],
                            ).paddingOnly(top: 8.w),
                          ],
                        ),
                        const SizedBox(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                borderRadius: AppBorderRadius.small,
                                color: AppColors.filledButton,
                              ),
                              child: Icon(
                                Icons.coffee,
                                color: AppColors.button,
                                size: 24.w,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                borderRadius: AppBorderRadius.small,
                                color: AppColors.filledButton,
                              ),
                              child: Icon(
                                Icons.local_drink,
                                color: AppColors.button,
                                size: 24.w,
                              ),
                            ).paddingOnly(left: 12)
                          ],
                        )
                      ],
                    ),
                    const Divider(color: AppColors.filledGray).paddingSymmetric(vertical: 12),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.dark,
                            fontWeight: FontWeight.bold,
                          ),
                    ).paddingOnly(bottom: 12.w),
                    Text(
                      coffeeModel?.description ?? "",
                      maxLines: detailController.maxLines,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.price, letterSpacing: 1.1),
                    ),
                    InkWell(
                      onTap: () {
                        detailController.setMaxLine();
                      },
                      child: Text(
                        detailController.maxLines == 3 ? 'Read More' : 'Read Less',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.button,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const BuildSize().paddingOnly(top: 12.w)
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
