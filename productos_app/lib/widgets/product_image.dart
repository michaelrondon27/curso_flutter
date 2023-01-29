import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
   
  const ProductImage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _bvuildBoxDecoration(),
        height: 450,
        width: double.infinity,
        child: const ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          ),
        )
      ),
    );
  }

  BoxDecoration _bvuildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: <BoxShadow> [
      BoxShadow(
        blurRadius: 10,
        color: Colors.black12,
        offset: Offset(0, 5)
      )
    ],
    color: Colors.red
  );
}