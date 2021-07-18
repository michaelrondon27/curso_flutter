import 'package:flutter/material.dart';

import 'package:disenos/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background()
        ],
      ),
    );
  }
}