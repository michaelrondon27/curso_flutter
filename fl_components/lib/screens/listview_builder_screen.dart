import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();

}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        add5();
      }
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, i) => FadeInImage(
            fit: BoxFit.cover,
            height: 300,
            image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[i]}'),
            placeholder: const AssetImage('assets/jar-loading.gif'), 
            width: double.infinity
          ),
          physics: const BouncingScrollPhysics(),
        ),
      )
    );
  }

}