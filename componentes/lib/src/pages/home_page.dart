import 'package:flutter/material.dart';

// Pages
import 'package:componentes/src/pages/alert_page.dart';

// Providers
import 'package:componentes/src/providers/menu_provider.dart';

// Utils
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
          children: _listaItems( snapshot.data, context )
        );
      },
      future: menuProvider.cargarData(),
      initialData: [],
    );
  }

  List<Widget> _listaItems( List<dynamic>? data, BuildContext context ) {
    final List<Widget> opciones = [];

    data?.forEach( (opt) {
      final widgetTemp = ListTile(
        leading: getIcon( opt['icon'] ),
        onTap: () {
          final route = MaterialPageRoute(
            builder: ( context ) => AlertPage()
          );

          Navigator.push(context, route);
        },
        title: Text( opt['texto'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
      );

      opciones..add(widgetTemp)
            ..add(Divider());            
    });

    return opciones;
  }
}
