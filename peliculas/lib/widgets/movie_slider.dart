import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric( horizontal: 20 )
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: ( _, int index ) => _MoviePoster(),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      color: Colors.red,
      height: 250,
      width: double.infinity,
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 190,
      margin: EdgeInsets.all(10),
      width: 130,
    );
  }
}