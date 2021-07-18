import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xff5EE8C5),
        Color(0xff30BAD6)
      ],
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          children: [
            Page1(),

            Page2()
          ],
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
        ),
        decoration: boxDecoration,
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

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),

        MainContent()
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          child: Padding(
            child: Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            ),
            padding: EdgeInsets.symmetric( horizontal: 40 ),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff0098FA),
            shape: StadiumBorder()
          ),
        ),
      ),
      color: Color(0xff30BAD6),
    );
  }
}
