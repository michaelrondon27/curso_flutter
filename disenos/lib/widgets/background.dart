import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xff2E305F),
        Color(0xff202333)
      ],
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration
        ),

        Positioned(
          child: _Box(),
          left: -30,
          top: -100,
        )
      ],
    );
  }
}

class _Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 12.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
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
