import 'package:flutter/material.dart';

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
              _PosterAndTitle()
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
