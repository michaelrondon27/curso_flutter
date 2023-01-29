import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos')
      ),
      body: ListView.builder(
        itemBuilder: (_, int i) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product'),
          child: const ProductCard()
        ),
        itemCount: 10
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add)
      ),
    );
  }
}