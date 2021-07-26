import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: ( BuildContext context, AsyncSnapshot snapshot ) {
            if ( !snapshot.hasData )
              return Text('Espere');

            // if ( snapshot.data == '' ) {

            // }

            Future.microtask(() {
              Navigator.of(context).pushReplacementNamed('home');
            });

            return Container();
          },
          future: authService.readToken()
        )
      ),
    );
  }
}