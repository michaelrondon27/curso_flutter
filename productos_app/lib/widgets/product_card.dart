import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.only( bottom: 50, top: 30 ),
        height: 400,
        width: double.infinity,
      ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
    );
  }
}