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
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: _createCardShape(),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    boxShadow: const <BoxShadow> [
      BoxShadow(
        blurRadius: 15,
        color: Colors.black12,
        offset: Offset(0, 5)
      )
    ],
    color: Colors.white
  );
}