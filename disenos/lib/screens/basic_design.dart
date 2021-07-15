import 'package:flutter/material.dart';

class BasicDesingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/landscape.jpg'),
          ),

          Title(),

          ButtonSection(),

          Container(
            child: Text('Aliquip magna do nisi irure sunt ipsum culpa duis. Nulla culpa aliquip ipsum consectetur occaecat enim ad aliqua aliqua pariatur ullamco nulla occaecat. Quis velit Lorem nostrud occaecat deserunt. Ad minim aliqua ea irure quis cillum.'),
            margin: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
          )
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomButton( icon: Icons.call, text: 'Call' ),

          CustomButton( icon: Icons.map_sharp, text: 'Route' ),
          
          CustomButton( icon: Icons.share, text: 'Share' )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      margin: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key, 
    required this.icon, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.blue, size: 30),
        Text(this.text, style: TextStyle(color: Colors.blue))
      ],
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),

              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.black45
                )
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),

          Expanded(child: Container()),

          Icon( Icons.star, color: Colors.red ),

          Text('41')
        ],
      ),
      margin: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
    );
  }
}
