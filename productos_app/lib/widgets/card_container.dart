import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: this.child,
        decoration: _createCardShape(),
        padding: EdgeInsets.all(20),
        width: double.infinity,
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        blurRadius: 15,
        color: Colors.black12,
        offset: Offset(0, 5)
      )
    ],
    color: Colors.white,
  );
}