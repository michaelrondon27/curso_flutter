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

            _ProductsDetails(),

            Positioned(
              right: 0,
              top: 0,
              child: _PriceTag()
            ),
            
            Positioned(
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
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        decoration: _buildBoxDecoration(),
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Disco Duro G',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),

            Text(
              'Id del disco duro',
              style: TextStyle(
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
  
  const _PriceTag({Key? key}) : super(key: key);

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
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$103.99', style: TextStyle(color: Colors.white)),
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
