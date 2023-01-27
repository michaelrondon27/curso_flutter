import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => const _MoviePoster(),
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
  
  const _MoviePoster({Key? key}) : super(key: key);

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
                child: const FadeInImage(
                  fit: BoxFit.cover,
                  height: 190,
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  width: 130
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Starwars: El retorno del nuevo Jedi silvestre de Monte Cristo',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      )
    );
  }

}