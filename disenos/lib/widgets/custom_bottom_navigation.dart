import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
   
  const CustomBottomNavigation({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Calendario'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline_outlined),
          label: 'Grafica'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Usuarios'
        )
      ],
      selectedItemColor: Colors.pink,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1)
    );
  }
}