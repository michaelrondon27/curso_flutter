import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage( url: productsService.selectedProduct.picture ),

                  Positioned(
                    child: IconButton(
                      icon: Icon( Icons.arrow_back_ios_new, size: 40, color: Colors.white ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    left: 20,
                    top: 60,
                  ),

                  Positioned(
                    child: IconButton(
                      icon: Icon( Icons.camera_alt_outlined, size: 40, color: Colors.white ),
                      onPressed: () {},
                    ),
                    right: 20,
                    top: 60,
                  )
                ],
              ),

              _ProductForm(),

              SizedBox( height: 100 )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.save_outlined ),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Form(
          child: Column(
            children: [
              SizedBox( height: 5 ),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
              ),

              SizedBox( height: 15 ),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox( height: 15 ),

              SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                onChanged: ( value ) {},
                title: Text('Disponible'),
                value: true, 
              ),

              SizedBox( height: 30 )
            ],
          ),
        ),
        decoration: _buildBoxDecoration(),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        width: double.infinity,
      ),
      padding: EdgeInsets.symmetric( horizontal: 10 ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 25 ), bottomRight: Radius.circular( 25 )),
    boxShadow: [
      BoxShadow(
        blurRadius: 5,
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5)
      )
    ],
    color: Colors.white
  );
}