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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _bvuildBoxDecoration(),
        height: 450,
        width: double.infinity,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getImage(url)
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
    color: Colors.black
  );

  Widget getImage(String? picture) {
    if (picture == null) {
      return const Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/no-image.png')
      );
    }

    if (picture.startsWith('http')) {
      FadeInImage(
        fit: BoxFit.cover,
        image: NetworkImage(url!),
        placeholder: const AssetImage('assets/jar-loading.gif'),
      );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover
    );
  }
}