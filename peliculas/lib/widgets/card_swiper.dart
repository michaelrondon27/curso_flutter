import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
   
  const CardSwiper({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/details', arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://via.placeholder.com/300x400'),
              placeholder: AssetImage('assets/no-image.jpg')
            ),
          )
        ),
        itemCount: 10,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,
      )
    );
  }

}