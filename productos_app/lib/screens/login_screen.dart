import 'package:flutter/material.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: 250 ),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 10 ),

                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),

                    SizedBox( height: 30 ),

                    _LoginForm()
                  ],
                )
              ),

              SizedBox( height: 50 ),
            
              Text(
                'Crear una nueva cuenta',
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ),
              ),

              SizedBox( height: 50 ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_sharp
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
            ),

            SizedBox( height: 30 ),

            MaterialButton(
              child: Container(
                child: Text(
                  'Ingresar',
                  style: TextStyle( color: Colors.white ),
                ),
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15 ),
              ),
              color: Colors.deepPurple,
              disabledColor: Colors.grey,
              elevation: 0,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 10 )
              ),
            )
          ],
        ),
      ),
    );
  }
}
