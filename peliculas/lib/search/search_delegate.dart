import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton( 
        icon: Icon( Icons.clear ),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon( Icons.arrow_back ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if ( query.isEmpty ) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>( context, listen: false );

    return FutureBuilder(
      builder: ( _, AsyncSnapshot<List<Movie>> snapshot ) {
        if ( !snapshot.hasData ) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemBuilder: ( _, int index ) => _MovieItem( movies[index] ),
          itemCount: movies.length,
        );
      },
      future: moviesProvider.searchMovies( query )
    );
  }

  Widget _emptyContainer() {
    return Container(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 130
        ),
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem( this.movie ); 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        fit: BoxFit.contain,
        image: NetworkImage( movie.fullPosterImg ),
        placeholder: AssetImage('assets/no-image.jpg'),
        width: 50
      ),
      onTap: () => Navigator.pushNamed( context, 'details', arguments: movie ),
      subtitle: Text( movie.originalTitle ),
      title: Text( movie.title )
    );
  }
}