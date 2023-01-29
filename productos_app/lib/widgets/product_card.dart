import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
   
  const ProductCard({Key? key}) : super(key: key);
  
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
          children: const [
            _BackgroundImage(),

            _ProductsDetails()
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

  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const SizedBox(
        height: 400,
        width: double.infinity,
        child: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          placeholder: AssetImage('assets/jar-loading.gif')
        )
      ),
    );
  }

}

class _ProductsDetails extends StatelessWidget {

  const _ProductsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 70,
      width: double.infinity
    );
  }
}
