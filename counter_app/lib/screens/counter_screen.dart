import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({ Key? key }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();

}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  void decrease() => setState(() => counter--);

  void increase() => setState(() => counter++);

  void reset() => setState(() => counter = 0);


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
      floatingActionButton: CustomFloatingActions(
        decreaseFn: decrease,
        increaseFn: increase,
        resetFn: reset,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  
}

class CustomFloatingActions extends StatelessWidget {

  final Function decreaseFn;
  final Function increaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.decreaseFn,
    required this.increaseFn,
    required this.resetFn
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn()
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_outlined),
          onPressed: () => resetFn()
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn()
        )
      ],
    );
  }
}