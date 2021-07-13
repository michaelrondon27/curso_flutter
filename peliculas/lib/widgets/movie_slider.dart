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

          SizedBox( height: 5 ),

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
      height: 270,
      width: double.infinity,
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.cover,
                height: 190,
                image: NetworkImage('https://via.placeholder.com/300x400'),
                placeholder: AssetImage('assets/no-image.jpg'),
                width: 130,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-intance'),
          ),

          SizedBox( height: 5 ),

          Text(
            'Starwars: El retorno del nuevo Jedi',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
      height: 190,
      margin: EdgeInsets.symmetric( horizontal: 10 ),
      width: 130,
    );
  }
}