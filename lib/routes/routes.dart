import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/features/detail/detail_screen.dart';
import 'package:coffeeapp/features/home/home_screen.dart';
import 'package:coffeeapp/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case detail:
        final args = settings.arguments as CoffeeModel;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            coffeeModel: args,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
