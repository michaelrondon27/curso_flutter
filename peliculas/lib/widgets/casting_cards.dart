import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards( this.movieId );

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>( context, listen: false );

    return FutureBuilder(
      builder: ( _, AsyncSnapshot<List<Cast>> snapshot ) {
        if ( !snapshot.hasData ) {
          return Container(
            child: CupertinoActivityIndicator(),
            constraints: BoxConstraints( maxWidth: 150 ),
            height: 180,
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          child: ListView.builder(
            itemBuilder: ( _, int index ) => _CastCard( cast[index] ),
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
          ),
          height: 180,
          margin: EdgeInsets.only( bottom: 30 ),
          width: double.infinity,
        );
      },
      future: moviesProvider.getMovieCast( movieId )
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard( this.actor );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular( 20 ),
            child: FadeInImage(
              fit: BoxFit.cover,
              height: 140,
              image: NetworkImage( actor.fullProfilePath ),
              placeholder: AssetImage('assets/no-image.jpg'),
              width: 100,
            )
          ),

          SizedBox( height: 2 ),

          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
      height: 100,
      margin: EdgeInsets.symmetric( horizontal: 10 ),
      width: 110,
    );
  }
}
