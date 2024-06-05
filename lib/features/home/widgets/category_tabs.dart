import 'package:coffeeapp/core/constants/app_borders.dart';
import 'package:coffeeapp/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class BuildCategoryTabs extends StatelessWidget {
  const BuildCategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<HomeController>(
        builder: (homeController) {
          return SizedBox(
            height: 50.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CategoryListItem(
                    index: index,
                    text: homeController.categories[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final String? text;
  final int? index;
  const CategoryListItem({super.key, this.text, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return InkWell(
        onTap: () {
          homeController.changeCategoryIndex(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.small,
            color: homeController.selectedCategoryIndex == index ? AppColors.button : AppColors.white,
          ),
          child: Center(
              child: Text(
            text ?? "",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: homeController.selectedCategoryIndex == index ? AppColors.white : AppColors.price,
                ),
          )),
        ),
      );
    });
  }
}
