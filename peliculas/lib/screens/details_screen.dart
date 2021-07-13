import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              CastingCards()
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/500x300'),
          placeholder: AssetImage('assets/loading.gif'),
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'movie.title',
            style: TextStyle( fontSize: 16 ),
          ),
          color: Colors.black12,
          padding: EdgeInsets.only( bottom: 5 ),
          width: double.infinity
        ),titlePadding: EdgeInsets.all(0),
      ),
      floating: false,
      pinned: true,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              image: NetworkImage('https://via.placeholder.com/200x300'),
              placeholder: AssetImage('assets/no-image.jpg'),
            ),
          ),

          SizedBox( width: 20 ),

          Column(
            children: [
              Text(
                'movie.title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headline5
              ),

              Text(
                'movie.originalTitle',
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
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Eiusmod dolor laboris aliqua laboris consectetur. Consequat ad aliqua in eiusmod amet tempor consectetur id incididunt ut. Magna aliquip anim anim officia laborum in aute consectetur est. Qui eiusmod anim sunt minim ex eiusmod nostrud dolore. Mollit reprehenderit enim minim nostrud elit. Consectetur qui consectetur sint enim mollit nisi in.',
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
    );
  }
}
