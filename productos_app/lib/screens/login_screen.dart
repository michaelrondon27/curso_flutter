import 'package:flutter/material.dart';

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
              )
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
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 2
                  )
                ),
                hintText: 'john.doe@gmail.com',
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                labelText: 'Correo electrónico',
                prefixIcon: Icon( Icons.alternate_email_sharp, color: Colors.deepPurple )
              ),
              keyboardType: TextInputType.emailAddress,
            )
          ],
        ),
      ),
    );
  }
}
