import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xFF2E305F),
        Color(0xFF202333)
      ],
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8]
    )
  );
   
  const Background({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration
        ),

        const Positioned(
          left: -30,
          top: -100,
          child: _PinkBox()
        )
      ],
    );
  }

}

class _PinkBox extends StatelessWidget {
  
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]
          )
        ),
        height: 360,
        width: 360
      ),
    );
  }

}
