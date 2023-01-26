import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();

}

class _SliderScreenState extends State<SliderScreen> {

  bool _sliderEnabled = true;
  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && Checks')
      ),
      body: Column(
        children: [
          Slider.adaptive(
            activeColor: AppTheme.primaryColor,
            max: 400,
            min: 50,
            onChanged: _sliderEnabled ? (value) => setState(() => _sliderValue = value) : null,
            value: _sliderValue,
          ),

          Checkbox(
            onChanged: (value) => setState(() => _sliderEnabled = value ?? true),
            value: _sliderEnabled 
          ),

          CheckboxListTile(
            activeColor: AppTheme.primaryColor,
            onChanged: (value) => setState(() => _sliderEnabled = value ?? true),
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled 
          ),

          Switch(
            onChanged: (value) => setState(() => _sliderEnabled = value),
            value: _sliderEnabled
          ),

          SwitchListTile.adaptive(
            activeColor: AppTheme.primaryColor,
            onChanged: (value) => setState(() => _sliderEnabled = value),
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled 
          ),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                fit: BoxFit.contain,
                image: const NetworkImage('https://www.pngarts.com/files/18/Dragon-Ball-Goku-PNG-Pic.png'),
                width: _sliderValue,
              ),
            ),
          )
        ]
      )
    );
  }

}