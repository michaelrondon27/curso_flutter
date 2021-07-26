import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-8746b-default-rtdb.firebaseio.com';

  final List<Product> products = [];

  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'products.json');

    final resp = await http.get( url );

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );

      tempProduct.id = key;

      this.products.add( tempProduct );
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  Future saveOrCreateProduct( Product product ) async {
    isSaving = true;
    notifyListeners();

    if ( product.id == null ) {

    } else {
      await this.updateProduct( product );
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct( Product product ) async {
    final url = Uri.https( _baseUrl, 'products/${ product.id }.json');

    final resp = await http.put( url, body: product.toJson() );

    final decodeData = resp.body;

    return product.id!;
  }
}