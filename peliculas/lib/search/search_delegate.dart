import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return _emptyContainer();

    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      builder: (_, AsyncSnapshot<List<MovieModel>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final List<MovieModel> movies = snapshot.data!;

        return ListView.builder(
          itemBuilder: (_, int i) => _MovieItem(movie: movies[i]),
          itemCount: movies.length,
        );
      },
      future: movieProvider.searchMovies(query)
    );
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined, 
        color: Colors.black38,
        size: 100
      )
    );
  }

}

class _MovieItem extends StatelessWidget {
  
  final MovieModel movie;

  const _MovieItem({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(movie.fullPosterImg),
          placeholder: const AssetImage('assets/no-image.jpg'),
          width: 50
        ),
      ),
      onTap: () => Navigator.pushNamed(context, '/details', arguments: movie),
      subtitle: Text(movie.originalTitle),
      title: Text(movie.title)
    );
  }
}
