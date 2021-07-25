import 'package:flutter/material.dart';

import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key, 
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage( product.picture ),

            _ProductDetails(
              subTitle: product.id!,
              title: product.name,
            ),

            Positioned(
              child: _PriceTag( product.price ),
              right: 0,
              top: 0,
            ),

            if ( !product.available )
              Positioned(
                child: _NotAvailable(),
                left: 0,
                top: 0,
              )
          ],
        ),
        decoration: _cardBorders(),
        margin: EdgeInsets.only( bottom: 50, top: 30 ),
        height: 400,
        width: double.infinity,
      ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        color: Colors.black12,
        offset: Offset(0, 7)
      )
    ],
    color: Colors.white,
  );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage( this.url );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular( 25 ),
      child: Container(
        child: url == null
        ? Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/no-image.png')
          )
        : FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage( url! ),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
        height: 400,
        width: double.infinity,
      ),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Padding(
          child: Text(
            'No disponible',
            style: TextStyle( color: Colors.white, fontSize: 20 ),
          ),
          padding: EdgeInsets.symmetric( horizontal: 10 ),
        ),
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomRight: Radius.circular( 25 ), topLeft: Radius.circular( 25 ) ),
        color: Colors.yellow[800]
      ),
      height: 70,
      width: 100,
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag( this.price );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        child: Padding(
          child: Text(
            '\$$price',
            style: TextStyle( color: Colors.white, fontSize: 20 )
          ),
          padding: EdgeInsets.symmetric( horizontal: 10 ),
        ),
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 25 ), topRight: Radius.circular( 25 ) ),
        color: Colors.indigo
      ),
      height: 70,
      width: 100,
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String subTitle;
  final String title;

  const _ProductDetails({
    required this.subTitle, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Column(
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),
            ),

            Text(
              subTitle,
              style: TextStyle( color: Colors.white, fontSize: 15 ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        decoration: _buildBoxDecoration(),
        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        height: 70,
        width: double.infinity
      ),
      padding: EdgeInsets.only( right: 50 ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 25 ), topRight: Radius.circular( 25 ) ),
    color: Colors.indigo
  );
}