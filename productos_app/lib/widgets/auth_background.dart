import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
   
  const AuthBackground({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: const [
          _PurpleBox()
        ]
      )
    );
  }
}

class _PurpleBox extends StatelessWidget {
  
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      decoration: _purpleBackground(),
      height: size.height * 0.4,
      width: double.infinity,
      child: Stack(
        children: const [
          Positioned(left: 30, top: 90, child: _Bubble()),
          Positioned(left: -30, top: -40, child: _Bubble()),
          Positioned(right: -20, top: -50, child: _Bubble()),
          Positioned(bottom: -50, left: 10, child: _Bubble()),
          Positioned(bottom: 120, right: 20, child: _Bubble())
        ]
      )
    );
  }

  BoxDecoration _purpleBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ]
      )
    );
  }
}

class _Bubble extends StatelessWidget {
 
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
      height: 100,
      width: 100
    );
  }
}
