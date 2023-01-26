import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();

}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        fecthData();
      }
    });
  }

  Future fecthData() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    await Future.delayed(const  Duration(seconds: 3));

    add5();
    setState(() => isLoading = false);

    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300)
    );
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            ListView.builder(
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

            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 -30,
                child: const _LoadingIcon()
              )
          ],
        ),
      )
    );
  }

}

class _LoadingIcon extends StatelessWidget {

  const _LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ),
      height: 60,
      padding: const EdgeInsets.all(10),
      width: 60,
      child: const CircularProgressIndicator(color: AppTheme.primaryColor),
    );
  }

}