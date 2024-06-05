import 'package:coffeeapp/core/utils/theme_manager.dart';
import 'package:coffeeapp/features/splash/splash_screen.dart';
import 'package:coffeeapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Coffe App',
        defaultTransition: Transition.cupertino,
        navigatorKey: Get.key,
        theme: ThemeManager.instance.lightTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.splash,
      ),
      child: const SplashScreen(),
    );
  }
}
