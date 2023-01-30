import 'dart:io';

import 'package:flutter/material.dart';

import 'package:productos_app/models/product_model.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;

  const ProductCard({
    Key? key,
    required this.product
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: _cardBorders(),
        height: 400,
        margin: const EdgeInsets.only(bottom: 50, top: 30),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(url: product.picture),

            _ProductsDetails(
              id: product.id!,
              name: product.name
            ),

            Positioned(
              right: 0,
              top: 0,
              child: _PriceTag(price: product.price)
            ),
            
            if (!product.available)
              const Positioned(
                left: 0,
                top: 0,
                child: _NotAvailable()
              )
          ]
        )
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    boxShadow: const <BoxShadow> [
      BoxShadow(
        blurRadius: 10,
        color: Colors.black12,
        offset: Offset(0, 7)
      )
    ],
    color: Colors.white
  );

}

class _BackgroundImage extends StatelessWidget {

  final String? url;

  const _BackgroundImage({
    Key? key,
    this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: getImage(url)
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null) {
      return const Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/no-image.png')
      );
    }

    if (picture.startsWith('http')) {
      return FadeInImage(
        fit: BoxFit.cover,
        image: NetworkImage(url!),
        placeholder: const AssetImage('assets/jar-loading.gif')
      );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover
    );
  }

}

class _ProductsDetails extends StatelessWidget {

  final String id;
  final String name;

  const _ProductsDetails({
    Key? key,
    required this.id,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        decoration: _buildBoxDecoration(),
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),

            Text(
              id,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15
              )
            )
          ]
        )
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
    color: Colors.indigo
  );
}

class _PriceTag extends StatelessWidget {

  final double price;
  
  const _PriceTag({
    Key? key,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.indigo
      ),
      height: 70,
      width: 100,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price', style: const TextStyle(color: Colors.white)),
        ),
      )
    );
  }

}

class _NotAvailable extends StatelessWidget {
  
  const _NotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), topLeft: Radius.circular(25)),
        color: Colors.yellow[800]
      ),
      height: 70,
      width: 100,
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(color: Colors.white, fontSize: 20)
          )
        )
      ),
    );
  }

}
