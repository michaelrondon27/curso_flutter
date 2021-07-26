import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    final authService = Provider.of<AuthService>(context, listen: false);

    if ( productsService.isLoading ) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon( Icons.login_outlined ),
          onPressed: () {
            authService.logout();

            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          child: ProductCard(
            product: productsService.products[index],
          ),
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();

            Navigator.pushNamed(context, 'product');
          },
        ),
        itemCount: productsService.products.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          productsService.selectedProduct = new Product(
            available: false, 
            name: '', 
            price: 0
          );

          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}