import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider( create: ( _ ) => ProductsService() )
      ],
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'home'    : ( _ ) => HomeScreen(),
        'login'   : ( _ ) => LoginScreen(),
        'product' : ( _ ) => ProductScreen(),
        'register': ( _ ) => RegisterScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
          elevation: 0
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      title: 'Productos App',
    );
  }
}