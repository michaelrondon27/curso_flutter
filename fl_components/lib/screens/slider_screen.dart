import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();

}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && Checks')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slider.adaptive(
              activeColor: AppTheme.primaryColor,
              max: 400,
              min: 50,
              onChanged: (value) => setState(() => _sliderValue = value),
              value: _sliderValue,
            ),
      
            Image(
              fit: BoxFit.contain,
              image: const NetworkImage('https://www.pngarts.com/files/18/Dragon-Ball-Goku-PNG-Pic.png'),
              width: _sliderValue,
            )
          ]
        ),
      )
    );
  }

}