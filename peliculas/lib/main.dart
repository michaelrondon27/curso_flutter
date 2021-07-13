import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/screens/screens.dart';

import 'package:peliculas/providers/movies_provider.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider())
      ],
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo
        )
      ),
      title: 'Películas',
    );
  }
}