import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if ( this.title != null )
            Padding(
              child: Text(this.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              padding: EdgeInsets.symmetric( horizontal: 20 )
            ),

          SizedBox( height: 5 ),

          Expanded(
            child: ListView.builder(
              itemBuilder: ( _, int index ) => _MoviePoster( movies[index] ),
              itemCount: movies.length,
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
  final Movie movie;

  const _MoviePoster(
    this.movie
  );

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
                image: NetworkImage( movie.fullPosterImg ),
                placeholder: AssetImage('assets/no-image.jpg'),
                width: 130,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-intance'),
          ),

          SizedBox( height: 5 ),

          Text(
            movie.title,
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