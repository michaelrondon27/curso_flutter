import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards( this.movieId );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: ( _, int index ) => _CastCard(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
      height: 180,
      margin: EdgeInsets.only( bottom: 30 ),
      width: double.infinity,
    );
  }
}

class _CastCard extends StatelessWidget {
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
              image: NetworkImage('https://via.placeholder.com/150x300'),
              placeholder: AssetImage('assets/no-image.jpg'),
              width: 100,
            )
          ),

          SizedBox( height: 5 ),

          Text(
            'actor.name',
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
