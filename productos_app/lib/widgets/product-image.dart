import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only( topLeft: Radius.circular( 45 ), topRight: Radius.circular( 45 ) ),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          ),
        ),
        decoration: _buildBoxDecoration(),
        height: 450,
        width: double.infinity,
      ),
      padding: EdgeInsets.only( left: 10, right: 10, top: 10 ),
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