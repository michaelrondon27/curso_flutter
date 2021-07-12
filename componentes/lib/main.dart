import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: ( RouteSettings settings ) {
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );
      },
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Spanish, no country code
      ],
      routes: getApplicationRoutes(),
      title: 'Componentes App'
    );
  }
}