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

          Title()
        ],
      ),
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
