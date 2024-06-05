import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:coffeeapp/core/services/api_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

void main() {
  group('ApiServices', () {
    test('returns a list of CoffeeModel if the http call completes successfully', () async {
      final client = MockClient();
      final apiServices = ApiServices(client: client);

      final coffeeJson = [
        {
          "title": "Black Coffee",
          "description":
              "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır, sıcak olarak servis edilir. Eğer havalı olmak istiyorsanız siyah kahveye doğru adıyla 'café noir' diyebilirsiniz.",
          "ingredients": ["Kahve"],
          "image":
              "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "id": 1,
          "price": 6
        },
        {
          "title": "Latte",
          "description":
              "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur. Aromasız veya vanilyadan balkabağı baharatlarına kadar her şeyle tatlandırılmış olarak sipariş edilebilir.",
          "ingredients": ["Espresso", "Buharda ısıtılmış süt"],
          "image":
              "https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGxhdHRlfGVufDB8fDB8fHww",
          "id": 2,
          "price": 6
        }
      ];

      when(client.get(Uri.https('apimocha.com', 'kahve/coffee'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(json.encode(coffeeJson), 200));

      List<CoffeeModel?> coffeeModels = await apiServices.getCoffee();

      expect(coffeeModels, isA<List<CoffeeModel?>>());
      expect(coffeeModels.length, 2);
      expect(coffeeModels[0]?.title, "Black Coffee");
      expect(coffeeModels[1]?.title, "Latte");
    });

    test('returns 0 if the http call completes with an error', () async {
      final client = MockClient();
      final apiServices = ApiServices(client: client);

      when(client.get(Uri.https('apimocha.com', 'kahve/coffee'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      var result = await apiServices.getCoffee();

      expect(result, equals(0));
    });
  });
}
