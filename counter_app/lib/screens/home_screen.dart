import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Número de Clicks"),
            Text("10")
          ]
        ),
      )
    );
  }

}