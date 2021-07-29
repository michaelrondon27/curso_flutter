import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/pages/tabs_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        theme: miTema,
        title: 'Material App',
      ),
      providers: [
        ChangeNotifierProvider(create: ( _ ) => new NewsService())
      ],
    );
  }
}