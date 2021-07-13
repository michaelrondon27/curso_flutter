import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar()
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/500x300'),
          placeholder: AssetImage('assets/loading.gif'),
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'movie.title',
            style: TextStyle( fontSize: 16 ),
          ),
          color: Colors.black12,
          width: double.infinity
        ),titlePadding: EdgeInsets.all(0),
      ),
      floating: false,
      pinned: true,
    );
  }
}