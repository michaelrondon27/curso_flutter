import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({
    Key? key, 
    this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular( 45 ) ),
          child: this.url == null
            ? Image(
              fit: BoxFit.cover,
                image: AssetImage('assets/no-image.png')
              )
            : FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage( this.url! ),
            placeholder: AssetImage('assets/jar-loading.gif'),
          ),
        ),
        decoration: _buildBoxDecoration(),
        height: 450,
        width: double.infinity,
      ),
      padding: EdgeInsets.only( left: 10, right: 10, top: 5 ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular( 45 ) ),
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5)
      )
    ],
    color: Colors.red
  );
}