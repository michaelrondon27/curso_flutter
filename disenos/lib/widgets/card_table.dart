import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
   
  const CardTable({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.border_all,
              text: 'General'
            ),

            _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'
            )
          ]
        ),

        TableRow(
          children: [
            _SingleCard(
              color: Colors.purple,
              icon: Icons.shop,
              text: 'Shopping'
            ),

            _SingleCard(
              color: Colors.purpleAccent,
              icon: Icons.cloud,
              text: 'Bill'
            )
          ]
        ),

        TableRow(
          children: [
            _SingleCard(
              color: Colors.deepPurple,
              icon: Icons.movie,
              text: 'Entertaiment'
            ),

            _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.food_bank_outlined,
              text: 'Grocery'
            )
          ]
        ),

        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.border_all,
              text: 'General'
            ),

            _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'
            )
          ]
        )
      ]
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(62, 66, 107, 0.7)
      ),
      height: 180,
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, size: 35)
          ),

          const SizedBox(height: 10),

          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18
            )
          )
        ]
      )
    );
  }
}
