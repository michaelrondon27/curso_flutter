import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon( Icons.photo_album_outlined, color: AppTheme.primaryColor),
            subtitle: Text('Occaecat deserunt voluptate deserunt laborum. Pariatur eu occaecat aliqua culpa exercitation id quis deserunt enim excepteur sunt ipsum officia magna.'),
            title: Text('Soy un título')
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {}
                )
              ],
            ),
          )
        ]
      )
    );
  }
}