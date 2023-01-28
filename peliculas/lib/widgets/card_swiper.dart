import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<MovieModel> movies;
   
  const CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        height: size.height * 0.5,
        width: double.infinity,
        child: const Center(
          child: CircularProgressIndicator()
        )
      );
    }

    return SizedBox(
      height: size.height * 0.5,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/details', arguments: movies[i]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(movies[i].fullPosterImg),
              placeholder: const AssetImage('assets/no-image.jpg')
            ),
          )
        ),
        itemCount: movies.length,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,
      )
    );
  }

}