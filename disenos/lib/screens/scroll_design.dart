import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
   
  const ScrollDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Background(),

          MainContent()
        ]
      )
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
