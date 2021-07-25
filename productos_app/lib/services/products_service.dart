import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-8746b-default-rtdb.firebaseio.com';

  final List<Product> products = [];

  bool isLoading = true;

  ProductsService() {
    this.loadProducts();
  }

  Future loadProducts() async {
    final url = Uri.https( _baseUrl, 'products.json');

    final resp = await http.get( url );

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );

      tempProduct.id = key;

      this.products.add( tempProduct );
    });

    return this.products;
  }
}