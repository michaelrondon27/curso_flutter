import 'dart:io';

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
        child: Opacity(
          child: ClipRRect(
            borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular( 45 ) ),
            child: getImages( url ),
          ),
          opacity: 0.9,
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
    color: Colors.black
  );

  Widget getImages( String? picture ) {
    if ( picture == null ) 
      return Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/no-image.png')
      );
     
    if ( picture.startsWith('http') ) 
      return FadeInImage(
        fit: BoxFit.cover,
        image: NetworkImage( this.url! ),
        placeholder: AssetImage('assets/jar-loading.gif'),
      );
    
    return Image.file(
      File( picture ),
      fit: BoxFit.cover,
    );
  }
}