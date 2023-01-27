import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}, 
          )
        ],
        title: const Text('Películas en cines')
      ),
      body: Column(
        children: const [
          CardSwiper()
        ]
      )
    );
  }
}