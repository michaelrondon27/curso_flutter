import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
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
            ])
          )
        ]
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
        background: const FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/500x300'),
          placeholder: AssetImage('assets/loading.gif')
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          width: double.infinity,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16)
          )
        )
      ),
      floating: false,
      pinned: true
    );
  }

}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              height: 150,
              image: NetworkImage('https://via.placeholder.com/200x300'),
              placeholder: AssetImage('assets/no-image.jpg')
            )
          ),

          const SizedBox(width: 20),

          Column(
            children: [
              Text(
                'movie.title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headlineSmall
              ),

              Text(
                'movie.originalTitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall
              ),

              Row(
                children: [
                  const Icon(Icons.star_outline, color: Colors.grey, size: 15),

                  const SizedBox(width: 5),

                  Text('movie.voteAverage', style: textTheme.labelSmall)
                ]
              )
            ]
          )
        ]
      )
    );
  }

}
