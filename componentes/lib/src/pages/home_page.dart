import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista(),
    );
  }
      
  Widget _lista() {
    return FutureBuilder(
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(
          children: _listaItems( snapshot.data )
        );
      },
      future: menuProvider.cargarData(),
      initialData: [],
    );
  }

  List<Widget> _listaItems( List<dynamic>? data ) {
    final List<Widget> opciones = [];

    data?.forEach( (opt) {
      final widgetTemp = ListTile(
        leading: getIcon( opt['icon'] ),
        onTap: () {},
        title: Text( opt['texto'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
      );

      opciones..add(widgetTemp)
            ..add(Divider());            
    });

    return opciones;
  }
}
