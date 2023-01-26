import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();

}

class _AnimatedScreenState extends State<AnimatedScreen> {

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);
  Color _color = Colors.indigo;
  double _height = 50;
  double _width = 50;

  void changeShape() {
    final random = Random();

    _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble() + 10);
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _height = random.nextInt(300).toDouble() + 70;
    _width = random.nextInt(300).toDouble() + 70;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container')
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: const Duration(milliseconds: 400),
          height: _height,
          width: _width
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline, size: 35)
      )
    );
  }

}