import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/features/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_search.mocks.dart';

void main() {
  group('HomeController Search', () {
    late HomeController homeController;
    late MockApiServices mockApiServices;

    setUp(() {
      mockApiServices = MockApiServices();
      homeController = HomeController();
    });

    test('searchCoffee updates searchResult based on query', () async {
      // Mocking the response from ApiServices
      final coffeeList = [
        CoffeeModel(
          title: "Black Coffee",
          description: "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır.",
          ingredients: ["Kahve"],
          image: "https://images.unsplash.com/photo-1494314671902-399b18174975",
          id: 1,
          price: 6,
        ),
        CoffeeModel(
          title: "Latte",
          description:
              "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur.",
          ingredients: ["Espresso", "Buharda ısıtılmış süt"],
          image: "https://images.unsplash.com/photo-1561882468-9110e03e0f78",
          id: 2,
          price: 6,
        ),
      ];

      when(mockApiServices.getCoffee()).thenAnswer((_) async => coffeeList);

      await homeController.getCoffee();

      // Perform search
      homeController.searchCoffee('Latte');

      // Check results
      expect(homeController.searchResult!.length, 1);
      expect(homeController.searchResult![0]?.title, 'Latte');
    });

    test('searchCoffee does not duplicate results', () async {
      // Mocking the response from ApiServices
      final coffeeList = [
        CoffeeModel(
          title: "Black Coffee",
          description: "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır.",
          ingredients: ["Kahve"],
          image: "https://images.unsplash.com/photo-1494314671902-399b18174975",
          id: 1,
          price: 6,
        ),
        CoffeeModel(
          title: "Latte",
          description:
              "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur.",
          ingredients: ["Espresso", "Buharda ısıtılmış süt"],
          image: "https://images.unsplash.com/photo-1561882468-9110e03e0f78",
          id: 2,
          price: 6,
        ),
      ];

      when(mockApiServices.getCoffee()).thenAnswer((_) async => coffeeList);

      await homeController.getCoffee();

      // Perform search twice
      homeController.searchCoffee('Latte');
      homeController.searchCoffee('Latte');

      // Check results
      expect(homeController.searchResult!.length, 1);
      expect(homeController.searchResult![0]?.title, 'Latte');
    });

    test('searchCoffee returns empty results for no match', () async {
      // Mocking the response from ApiServices
      final coffeeList = [
        CoffeeModel(
          title: "Black Coffee",
          description: "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır.",
          ingredients: ["Kahve"],
          image: "https://images.unsplash.com/photo-1494314671902-399b18174975",
          id: 1,
          price: 6,
        ),
        CoffeeModel(
          title: "Latte",
          description:
              "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur.",
          ingredients: ["Espresso", "Buharda ısıtılmış süt"],
          image: "https://images.unsplash.com/photo-1561882468-9110e03e0f78",
          id: 2,
          price: 6,
        ),
      ];

      when(mockApiServices.getCoffee()).thenAnswer((_) async => coffeeList);

      await homeController.getCoffee();

      // Perform search with no matching result
      homeController.searchCoffee('Cappuccino');

      // Check results
      expect(homeController.searchResult!.length, 0);
    });
  });
}
