import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => const _MoviePoster(),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          )
        ]
      )
    );
  }
}

class _MoviePoster extends StatelessWidget {
  
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      margin: const EdgeInsets.all(10),
      height: 190,
      width: 130
    );
  }

}