import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: productsService.selectedProduct.picture),

                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.camera, size: 40, color: Colors.white),
                    onPressed: () {}
                  )
                )
              ]
            ),

            const _ProductForm(),

            const SizedBox(height: 100)
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _ProductForm extends StatelessWidget {

  const _ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                )
              ),

              const SizedBox(height: 30),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
                keyboardType: TextInputType.number
              ),

              const SizedBox(height: 30),

              SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                onChanged: (value) {},
                title: const Text('Disponible'),
                value: true
              ),

              const SizedBox(height: 30)
            ],
          )
        )
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    boxShadow: <BoxShadow> [
      BoxShadow(
        blurRadius: 5,
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5)
      )
    ],
    color: Colors.white
  );
}