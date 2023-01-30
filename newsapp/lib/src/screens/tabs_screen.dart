import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/screens/tab1_screen.dart';
import 'package:newsapp/src/screens/tab2_screen.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  
  const _Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para Ti'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados'
        )
      ],
      onTap: (value) => navigationModel.currentPage = value
    );
  }
}

class _Pages extends StatelessWidget {

  const _Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget> [
        Tab1Screen(),
        Tab2Screen()
      ]
    );
  }
}

class _NavigationModel extends ChangeNotifier {

  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}
