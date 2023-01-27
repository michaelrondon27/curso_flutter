import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
   
  const CastingCards({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (_, i) => _CastCard(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      )
    );
  }

}

class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 110,
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                fit: BoxFit.cover,
                height: 140,
                image: NetworkImage('https://via.placeholder.com/150x300'),
                placeholder: AssetImage('assets/no-image.jpg'),
                width: 100
              )
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'actor.name anfodnsfs',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ) 
        ]
      )
    );
  }

}