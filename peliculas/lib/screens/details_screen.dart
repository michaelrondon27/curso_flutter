import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';
import 'package:peliculas/models/models.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final MovieModel movie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),

              _Overview(movie: movie),

              CastingCards(movieId: movie.id)
            ])
          )
        ]
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final MovieModel movie;

  const _CustomAppBar({
    Key? key,
    required this.movie
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(movie.fullBackdropPath),
          placeholder: const AssetImage('assets/loading.gif')
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16)
          )
        )
      ),
      floating: false,
      pinned: true
    );
  }

}

class _PosterAndTitle extends StatelessWidget {

  final MovieModel movie;

  const _PosterAndTitle({
    Key? key,
    required this.movie
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 150,
                image: NetworkImage(movie.fullPosterImg),
                placeholder: const AssetImage('assets/no-image.jpg')
              )
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall
                ),
          
                Text(
                  movie.originalTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall
                ),
          
                Row(
                  children: [
                    const Icon(Icons.star_outline, color: Colors.grey, size: 15),
          
                    const SizedBox(width: 5),
          
                    Text('${movie.voteAverage}', style: textTheme.labelSmall)
                  ]
                )
              ]
            ),
          )
        ]
      )
    );
  }

}

class _Overview extends StatelessWidget {

  final MovieModel movie;

  const _Overview({
    Key? key,
    required this.movie
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.justify
      )
    );
  }

}
