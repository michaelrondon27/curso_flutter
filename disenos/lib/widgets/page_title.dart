import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
   
  const PageTitle({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Clasify transaction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),

            SizedBox(height: 10),
      
            Text(
              'Clasify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              )
            )
          ]
        ),
      )
    );
  }
}