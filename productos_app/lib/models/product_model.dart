import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.available,
    this.id,
    required this.name,
    this.picture,
    required this.price
  });

  bool available;
  String? id;
  String name;
  String? picture;
  double price;

  factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
    available: json['available'],
    name: json['name'],
    picture: json['picture'],
    price: json['price'].toDouble()
  );

  Map<String, dynamic> toMap() => {
    'available': available,
    'name': name,
    'picture': picture,
    'price':  price
  };

  ProductModel copy() => ProductModel(
    available: available,
    id: id,
    name: name,
    picture: picture,
    price: price
  );
}
