import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/screens/screens.dart';
import 'package:peliculas/providers/movies_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  MoviesProvider(), lazy: false)
      ],
      child: MyApp()
    );    
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/home',
      routes: {
        '/details': (_) => const DetailsScreen(),
        '/home': (_) => const HomeScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const  AppBarTheme(
          centerTitle: true,
          color: Colors.indigo,
          elevation: 0
        )
      )
    );
  }
}