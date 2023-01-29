import 'package:flutter/material.dart';

import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'https://flutter-varios-8746b-default-rtdb.firebaseio.com';

  final List<ProductModel> products = [];

}
