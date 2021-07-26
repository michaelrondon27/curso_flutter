import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      child: _ProductScreenBody(
        productsService: productsService
      ),
      create: ( _ ) => ProductFormProvider( productsService.selectedProduct ),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

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
                      onPressed: () async {
                        final picker = new ImagePicker();

                        final XFile? xFile = await picker.pickImage(
                          imageQuality: 100,
                          source: ImageSource.camera
                        );

                        if ( xFile == null ) return;
                      },
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
        onPressed: () async {
          if ( !productForm.isValidForm() ) return;

          await productsService.saveOrCreateProduct( productForm.product );
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    final product = productForm.product;

    return Padding(
      child: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox( height: 5 ),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
                initialValue: product.name,
                onChanged: ( value ) => product.name = value,
                validator: ( value ) {
                  if ( value == null || value.length < 1 ) {
                    return "El nombre es obligatorio";
                  }
                },
              ),

              SizedBox( height: 15 ),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
                initialValue: "${ product.price }",
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                keyboardType: TextInputType.number,
                onChanged: ( value ) {
                  if ( double.tryParse( value ) == null ) {
                    product.price = 0;
                  } else {
                    product.price = double.parse( value );
                  }
                },
              ),

              SizedBox( height: 15 ),

              SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                onChanged: productForm.updateAvailability,
                title: Text('Disponible'),
                value: product.available, 
              ),

              SizedBox( height: 30 )
            ],
          ),
          key: productForm.formKey,
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