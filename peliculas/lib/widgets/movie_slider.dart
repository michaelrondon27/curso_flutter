import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<MovieModel> movies;
  final String? title;
   
  const MovieSlider({
    Key? key,
    required this.movies,
    this.title
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              )
            ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => _MoviePoster(movie: movies[i]),
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

  final MovieModel movie;
  
  const _MoviePoster({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 190,
      width: 130,
      child: Column(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/details', arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: 190,
                  image: NetworkImage(movie.fullPosterImg),
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  width: 130
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      )
    );
  }

}