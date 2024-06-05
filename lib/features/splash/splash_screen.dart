import 'package:coffeeapp/core/constants/app_borders.dart';
import 'package:coffeeapp/core/constants/app_colors.dart';
import 'package:coffeeapp/core/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            AssetManager.instance.splash_image,
          ), //
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Coffee so good,\n your taste buds\n will love it',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 16.w).animate().fade(),
                Text(
                  'The best grain, the finest roast, the powerful flavor',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.white,
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ).paddingSymmetric(vertical: 16.w).animate().fade(delay: 300.ms),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  icon: Image.asset(AssetManager.instance.google, height: 24.w),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width, 100.w),
                    backgroundColor: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.small,
                    ),
                  ),
                  label: Text(
                    'Continue with Google',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ).paddingSymmetric(horizontal: 24.w, vertical: 24.w).animate().fade(delay: 500.ms),
              ],
            ),
          )
        ],
      ),
    );
  }
}
