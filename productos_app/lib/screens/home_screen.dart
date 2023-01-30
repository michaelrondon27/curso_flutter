import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos')
      ),
      body: ListView.builder(
        itemBuilder: (_, int i) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[i].copy();
            Navigator.pushNamed(context, '/product');
          },
          child: ProductCard(product: productsService.products[i])
        ),
        itemCount: productsService.products.length
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productsService.selectedProduct = ProductModel(
            available: false,
            name: '',
            price: 0
          );
          Navigator.pushNamed(context, '/product');
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}