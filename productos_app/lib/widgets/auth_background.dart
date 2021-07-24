import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _PurpleBox()
        ],
      ),
      height: double.infinity,
      width: double.infinity,
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: [
          Positioned(child: _Bubble(), left: 30, top: 90),
          Positioned(child: _Bubble(), left: -30, top: -40),
          Positioned(child: _Bubble(), right: -20, top: -50),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20),
        ],
      ),
      decoration: _purpleBackground(),
      height: size.height * 0.4,
      width: double.infinity,
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
      height: 100,
      width: 100,
    );
  }
}
