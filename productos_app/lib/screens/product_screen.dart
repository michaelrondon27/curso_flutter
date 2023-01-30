import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider( productsService.selectedProduct ),
      child: _ProductScreenBody(productsService: productsService)
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
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        imageQuality: 100,
                        source: ImageSource.gallery
                      );

                      if (pickedFile == null) return;

                      productsService.updateSelectedProductImage(pickedFile.path);
                    }
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
        onPressed: productsService.isSaving ? null : () async {
          if (!productForm.isValidForm()) return;

          final String? imageUrl = await productsService.uploadImage();

          if (imageUrl != null) productForm.product.picture = imageUrl;
        
          await productsService.saveOrCreateProduct(productForm.product);
        },
        child: productsService.isSaving ? const CircularProgressIndicator(color: Colors.white) : const Icon(Icons.save_outlined)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _ProductForm extends StatelessWidget {

  const _ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: productForm.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                }
              ),

              const SizedBox(height: 30),

              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
                initialValue: '${product.price}',
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))],
                keyboardType: TextInputType.number,
                onChanged: (value) => (double.tryParse(value) == null) ? product.price = 0 : product.price = double.parse(value)
              ),

              const SizedBox(height: 30),

              SwitchListTile.adaptive(
                activeColor: Colors.indigo,
                onChanged: productForm.updateAvailability,
                title: const Text('Disponible'),
                value: product.available
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