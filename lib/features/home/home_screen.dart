import 'package:coffeeapp/core/constants/app_borders.dart';
import 'package:coffeeapp/core/constants/app_colors.dart';
import 'package:coffeeapp/core/utils/asset_manager.dart';
import 'package:coffeeapp/features/home/home_controller.dart';
import 'package:coffeeapp/features/home/widgets/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/build_grid.dart';
import 'widgets/category_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.button,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: AppColors.white,
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            alignment: Alignment.topCenter,
                            height: 250,
                            decoration: const BoxDecoration(
                              color: AppColors.dark,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Location',
                                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                                  color: AppColors.white,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Istanbul,Turkey',
                                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 24.w,
                                                color: AppColors.white,
                                              ).paddingOnly(left: 6)
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(),
                                      CircleAvatar(
                                        radius: 28.w,
                                        backgroundImage: AssetImage(AssetManager.instance.avatar),
                                      )
                                    ],
                                  ),
                                  TextField(
                                    controller: homeController.searchCoffeeController,
                                    onChanged: (val) {
                                      homeController.debouncer.run(() {
                                        homeController.searchCoffee(val);
                                      });
                                    },
                                    cursorColor: AppColors.white,
                                    showCursor: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(color: AppColors.white),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                        color: AppColors.white,
                                        size: 24.w,
                                      ),
                                      hintText: 'Search Coffee',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: AppColors.white),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: AppColors.white),
                                      border: const OutlineInputBorder(
                                        borderRadius: AppBorderRadius.small,
                                        borderSide: BorderSide(
                                          color: AppColors.filledDark,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: AppBorderRadius.small,
                                        borderSide: BorderSide(
                                          color: AppColors.filledDark,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: AppBorderRadius.small,
                                        borderSide: BorderSide(
                                          color: AppColors.filledDark,
                                        ),
                                      ),
                                    ),
                                  ).paddingSymmetric(vertical: 16),
                                ],
                              ),
                            ),
                          ),
                          IgnorePointer(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.only(top: 200.h, left: 55.w, right: 55.w),
                              decoration: const BoxDecoration(
                                borderRadius: AppBorderRadius.small,
                              ),
                              child: Image.asset(
                                AssetManager.instance.home_banner,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const BuildCategoryTabs(),
                      Builder(builder: (context) {
                        if (homeController.searchCoffeeController?.text.isEmpty == true) {
                          return const BuildGrid();
                        } else {
                          return const SearchResult();
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
