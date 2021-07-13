import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar( movie ),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle( movie ),

              _Overview( movie ),
              
              CastingCards( movie.id )
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar( this.movie );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage( movie.fullBackdropPath ),
          placeholder: AssetImage('assets/loading.gif'),
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title,
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
          color: Colors.black12,
          padding: EdgeInsets.only( bottom: 10, left: 10, right: 10 ),
          width: double.infinity
        ),titlePadding: EdgeInsets.all(0),
      ),
      floating: false,
      pinned: true,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle( this.movie );

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              image: NetworkImage( movie.fullPosterImg ),
              placeholder: AssetImage('assets/no-image.jpg'),
              width: 110
            ),
          ),

          SizedBox( width: 20 ),

          Column(
            children: [
              ConstrainedBox(
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headline5
                    ),

                    Text(
                      movie.originalTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.subtitle1
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: Colors.grey,
                          size: 15,                    
                        ),

                        SizedBox( width: 5 ),

                        Text(
                          '${movie.voteAverage}',
                          style: textTheme.caption,
                        )
                      ],
                    )
                  ],
                ),
                constraints: BoxConstraints( maxWidth: size.width - 190 )
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
      margin: EdgeInsets.only( top: 20),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview( this.movie );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        movie.overview,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
    );
  }
}
