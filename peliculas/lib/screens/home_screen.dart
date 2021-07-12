import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () {},
          )
        ],
        elevation: 0,
        title: Text('Películas en cines'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),
            MovieSlider()
          ],
        )
      )
    );
  }
}