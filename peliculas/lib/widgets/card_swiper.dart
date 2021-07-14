import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if ( this.movies.length == 0 ) {
      return Container(
        child: Center(
          child: CircularProgressIndicator()
        ),
        height: size.height * 0.5,
        width: double.infinity,
      );
    }

    return Container(
      child: Swiper(
        itemBuilder: ( _, int index ) {

          final movie = movies[index];

          movie.heroId = 'swiper-${ movie.id }';

          return GestureDetector(
            child: Hero(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage( movie.fullPosterImg ),
                  placeholder: AssetImage('assets/no-image.jpg')
                ),
              ),
              tag: movie.heroId!,
            ),
            onTap: () => Navigator.pushNamed( context, 'details', arguments: movie ),
          );
        
        },
        itemCount: movies.length,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,
      ),
      height: size.height * 0.5,
      width: double.infinity
    );
  }
}