// ignore_for_file: prefer_collection_literals, unnecessary_new

import 'base_model.dart';

class CoffeeModel extends IBaseModel {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;
  int? price;

  CoffeeModel({this.title, this.description, this.ingredients, this.image, this.id, this.price});

  CoffeeModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'];
    price = json['price'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['image'] = image;
    data['id'] = id;
    data['price'] = price;
    return data;
  }

  @override
  fromJson(Map json) {
    return CoffeeModel.fromJson(json);
  }
}
