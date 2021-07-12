import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        itemBuilder: ( _, int index ) {
          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://via.placeholder.com/300x400'),
                placeholder: AssetImage('assets/no-image.jpg')
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instace'),
          );
        },
        itemCount: 10,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,
      ),
      height: size.height * 0.5,
      width: double.infinity
    );
  }
}