import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.border_all, text: 'General'),

            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport')
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.purple, icon: Icons.shop, text: 'Shopping'),

            _SingleCard(color: Colors.purpleAccent, icon: Icons.cloud, text: 'Bill')
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.deepPurple, icon: Icons.movie, text: 'Entertaiment'),

            _SingleCard(color: Colors.purpleAccent, icon: Icons.food_bank_outlined, text: 'Grocery')
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.border_all, text: 'General'),

            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport')
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const _SingleCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 20 ),
        child: BackdropFilter(
          child: Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: this.color,
                  child: Icon( this.icon ,size: 35, color: Colors.white ),
                  radius: 30,
                ),

                SizedBox( height: 10 ),
                
                Text(
                  this.text,
                  style: TextStyle(
                    color: this.color,
                    fontSize: 18
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(62, 66, 107, 0.7)
            ),
            height: 180,
          ),
          filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
        ),
      ),
      margin: EdgeInsets.all(15),
    );
  }
}
