import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return const Scaffold(
      body: Center(
         child: Text('Tab1Screen'),
      ),
    );
  }
}