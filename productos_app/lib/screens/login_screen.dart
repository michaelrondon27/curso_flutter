import 'package:flutter/material.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),

              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Text('Login', style: Theme.of(context).textTheme.headlineMedium),

                    const SizedBox(height: 30),

                    _LoginForm()
                  ]
                )
              ),

              const SizedBox(height: 50),

              const Text(
                'Crear una nueva cuenta',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 50),
            ]
          )
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {

  const _LoginForm({Key? key}) : super(key: key);

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
                prefixIcon: Icons.alternate_email_rounded
              ),
              keyboardType: TextInputType.emailAddress
            ), 

            const SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              obscureText: true
            ),

            const SizedBox(height: 30),

            MaterialButton(
              color: Colors.deepPurple,
              disabledColor: Colors.grey,
              onPressed: () {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
              )
            )
          ]
        )
      )
    );
  }
}
