import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: const [
              CustomInputField(
                hintText: 'Nombre del usuario',
                labelText: 'Nombre'
              ),
              SizedBox(height: 30),

              CustomInputField(
                hintText: 'Apellido del usuario',
                labelText: 'Apellido'
              ),
              SizedBox(height: 30),

              CustomInputField(
                hintText: 'Correo del usuario',
                keyboardType: TextInputType.emailAddress,
                labelText: 'Correo'
              ),
              SizedBox(height: 30),

              CustomInputField(
                hintText: 'Contraseña del usuario',
                labelText: 'Contraseña',
                obscureText: true
              ),
              SizedBox(height: 30)
            ],
          )
        )
      )
    );
  }
}
