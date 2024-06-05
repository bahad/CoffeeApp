import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/core/services/api_services.dart';
import 'package:coffeeapp/core/utils/debouncer_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  TextEditingController? searchCoffeeController;

  List<CoffeeModel?>? coffeeModel;
  getCoffee() async {
    coffeeModel = await ApiServices().getCoffee();
    update();
  }

  List<CoffeeModel?>? searchResult = [];

  List<String> categories = [
    "Cappuccino",
    "Americano",
    "Kahve",
    "Espresso",
    "Macchiato",
    "Mocha",
    "Hot Chocolate",
    "Chai Latte",
  ];

  int? selectedCategoryIndex = 0;

  changeCategoryIndex(int? index) {
    selectedCategoryIndex = index;
    update();
  }

  final debouncer = Debouncer(milliseconds: 500);

  void searchCoffee(String query) {
    if (coffeeModel != null && coffeeModel!.isNotEmpty) {
      searchResult?.clear();
      coffeeModel?.forEach((coffee) {
        if (coffee!.description!.trim().toLowerCase().contains(query.trim().toLowerCase()) ||
            coffee.title!.trim().toLowerCase().contains(query.trim().toLowerCase())) {
          bool exists = searchResult!.any((element) => element == coffee);
          if (!exists) {
            searchResult?.add(coffee);
          }
        }
      });
      update();
    }
  }

  @override
  void onInit() {
    searchCoffeeController = TextEditingController();
    getCoffee();
    super.onInit();
  }

  @override
  void onClose() {
    searchCoffeeController?.dispose();
    super.onClose();
  }
}
