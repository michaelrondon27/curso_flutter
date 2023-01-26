import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatelessWidget {
   
  const ListviewBuilderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) => FadeInImage(
            fit: BoxFit.cover,
            height: 300,
            image: NetworkImage('https://picsum.photos/500/300?image=${i + 1}'),
            placeholder: const AssetImage('assets/jar-loading.gif'), 
            width: double.infinity
          )
        ),
      )
    );
  }
}