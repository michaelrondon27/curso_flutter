import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xFF5EE8C5),
        Color(0xFF30BAD6)
      ],
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5]
    )
  );
   
  const ScrollDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            Page1(),
            Page2()
          ]
        ),
      )
    );
  }
}

class Page1 extends StatelessWidget {
  
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Background(),

        MainContent()
      ]
    );
  }
}

class Background extends StatelessWidget {

  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: const Color(0xFF30BAD6),
      height: double.infinity,
      child: const Image(
        image: AssetImage('assets/scroll-1.png')
      ),
    );
  }

}

class MainContent extends StatelessWidget {
  
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.bold
    );
    
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),

          const Text('11°', style: textStyle),
    
          const Text('Miércoles', style: textStyle),
    
          Expanded(child: Container()),
    
          const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white)
        ]
      ),
    );
  }

}

class Page2 extends StatelessWidget {
  
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF0098FA),
            shape: const StadiumBorder()
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              )
            ),
          )
        )
      )
    );
  }

}
