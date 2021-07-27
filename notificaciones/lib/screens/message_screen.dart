import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Message')
      ),
      body: Center(
        child: Text('Message Screen', style: TextStyle( fontSize: 30 )),
      ),
    );
  }
}