import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_borders.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/routes.dart';
import '../home_controller.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<HomeController>(
        builder: (homeController) {
          if (homeController.coffeeModel == null ||
              homeController.coffeeModel?.isEmpty == true ||
              homeController.searchResult?.isEmpty == true) {
            return const SizedBox();
          } else {
            return SizedBox(
              height: 270.h,
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
                    itemCount: homeController.searchResult?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.detail,
                            arguments: homeController.searchResult?[index]),
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
                                          imageUrl: homeController.searchResult?[index]?.image ?? "",
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
                                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                                  color: AppColors.white, fontWeight: FontWeight.bold),
                                            ).paddingOnly(left: 12)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(homeController.searchResult?[index]?.title ?? "",
                                        style: Theme.of(context).textTheme.titleSmall)
                                    .paddingOnly(top: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "€ ${homeController.searchResult?[index]?.price ?? ""}",
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
                    },
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
