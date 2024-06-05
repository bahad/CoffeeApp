import 'package:coffeeapp/features/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_borders.dart';
import '../../../core/constants/app_colors.dart';

class BuildSize extends StatelessWidget {
  const BuildSize({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (detailController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => detailController.changeSelectedSize(0),
              child: Container(
                width: Get.width / 3.5,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  color: detailController.selectedSize == 0 ? AppColors.filledButton : AppColors.white,
                  border: Border.all(
                    color: detailController.selectedSize == 0 ? AppColors.button : AppColors.gray,
                  ),
                ),
                child: const Center(
                  child: Text('S'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => detailController.changeSelectedSize(1),
              child: Container(
                width: Get.width / 3.5,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  color: detailController.selectedSize == 1 ? AppColors.filledButton : AppColors.white,
                  border: Border.all(
                    color: detailController.selectedSize == 1 ? AppColors.button : AppColors.gray,
                  ),
                ),
                child: const Center(child: Text('M')),
              ),
            ),
            GestureDetector(
              onTap: () => detailController.changeSelectedSize(2),
              child: Container(
                width: Get.width / 3.5,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  color: detailController.selectedSize == 2 ? AppColors.filledButton : AppColors.white,
                  border: Border.all(
                    color: detailController.selectedSize == 2 ? AppColors.button : AppColors.gray,
                  ),
                ),
                child: const Center(child: Text('L')),
              ),
            ),
          ],
        );
      },
    );
  }
}
