import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({ Key? key }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();

}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('CounterScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Número de Clicks', style: fontSize),
            Text('$counter', style: fontSize)
          ]
        ),
      ),
      floatingActionButton: const CustomFloatingActions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  
}

class CustomFloatingActions extends StatelessWidget {
  const CustomFloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FloatingActionButton(
          child: Icon(Icons.exposure_plus_1_outlined),
          onPressed: null
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_outlined),
          onPressed: null
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_minus_1_outlined),
          onPressed: null
        )
      ],
    );
  }
}