import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
   
  const ProductCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 400,
      margin: const EdgeInsets.only(bottom: 50, top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity
    );
  }
}