import 'dart:convert';
import 'package:coffeeapp/core/data/coffee_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

abstract interface class IApiServices {
  Future getCoffee();
}

class ApiServices implements IApiServices {
  static const url = "apimocha.com";
  final Client? client;

  ApiServices({Client? client}) : client = client ?? Client();
  @override
  Future<dynamic> getCoffee() async {
    try {
      final response = await client?.get(
        Uri.https(
          url,
          "kahve/coffee",
        ),
        headers: {
          "Accept": "application/json",
          "Charset": "utf-8",
        },
      );
      List<dynamic> jsonResponse = json.decode(utf8.decode(response!.bodyBytes));
      return jsonResponse.map((job) => CoffeeModel.fromJson(job)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }
}
