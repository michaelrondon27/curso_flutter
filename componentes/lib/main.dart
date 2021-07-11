import 'package:flutter/material.dart';

// Pages
import 'package:componentes/src/pages/alert_page.dart';

// Routes
import 'package:componentes/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: ( RouteSettings settings ) {
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );
      },
      routes: getApplicationRoutes(),
      title: 'Componentes App'
    );
  }
}