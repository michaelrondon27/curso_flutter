import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final Function onNextPage;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    required this.onNextPage,
    this.title
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if ( scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 ) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if ( this.widget.title != null )
            Padding(
              child: Text(this.widget.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              padding: EdgeInsets.symmetric( horizontal: 20 )
            ),

          SizedBox( height: 5 ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: ( _, int index ) => _MoviePoster( widget.movies[index], '${ widget.title }-$index-${ widget.movies[index].id }' ),
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: 270,
      width: double.infinity,
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final String heroId;
  final Movie movie;

  const _MoviePoster(
    this.movie,
    this.heroId
  );

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Hero(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: 190,
                  image: NetworkImage( movie.fullPosterImg ),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  width: 130,
                ),
              ),
              tag: movie.heroId!,
            ),
            onTap: () => Navigator.pushNamed( context, 'details', arguments: movie ),
          ),

          SizedBox( height: 5 ),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
      height: 190,
      margin: EdgeInsets.symmetric( horizontal: 10 ),
      width: 130,
    );
  }
}