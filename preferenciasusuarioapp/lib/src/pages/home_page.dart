import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Preferencias de Usuario'),
      ),
      body: Column(
        children: [
          Text('Color secundario:'),

          Divider(),

          Text('Género: ${ prefs.genero }'),

          Divider(),
          
          Text('Nombre de usuario:'),

          Divider(),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      drawer: MenuWidget(),
    );
  }
}
