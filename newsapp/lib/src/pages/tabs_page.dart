import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
      create: ( _ ) => new _NavegacionModel(),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.person_outline ),
          label: 'Para ti' 
        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.public ),
          label: 'Encabezados' 
        ),
      ],
      onTap: ( i ) => navegacionModel.paginaActual = i,
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    
    return PageView(
      children: [
        Tab1Page(),

        Tab2Page()
      ],
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual( int value ) {
    this._paginaActual = value;

    this._pageController.animateToPage(value, duration: Duration( milliseconds: 250 ), curve: Curves.easeOut );

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
