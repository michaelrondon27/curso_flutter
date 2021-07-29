import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return PageView(
      children: [
        Container(
          color: Colors.red,
        ),

        Container(
          color: Colors.green,
        )
      ],
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual( int value ) {
    this._paginaActual = value;

    notifyListeners();
  }
}
