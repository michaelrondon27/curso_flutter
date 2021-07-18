import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),

          MainContent()
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage('assets/scroll.png'),
      ),
      color: Color(0xff30BAD6),
      height: double.infinity,
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle( color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold );

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox( height: 30 ),

          Text('11°', style: textStyle),

          Text('Miércoles', style: textStyle),

          Expanded(child: Container()),

          Icon( Icons.keyboard_arrow_down, size: 100, color: Colors.white )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
