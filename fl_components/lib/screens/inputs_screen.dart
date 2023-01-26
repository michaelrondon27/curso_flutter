import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email': 'mrondon72@gmail.com',
      'first_name': 'Michael',
      'last_name': 'Rondon',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  formProperty: 'first_name',
                  formValues: formValues,
                  hintText: 'Nombre del usuario',
                  labelText: 'Nombre'
                ),
                const SizedBox(height: 30),
          
                CustomInputField(
                  formProperty: 'last_name',
                  formValues: formValues,
                  hintText: 'Apellido del usuario',
                  labelText: 'Apellido'
                ),
                const SizedBox(height: 30),
          
                CustomInputField(
                  formProperty: 'email',
                  formValues: formValues,
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Correo'
                ),
                const SizedBox(height: 30),
          
                CustomInputField(
                  formProperty: 'password',
                  formValues: formValues,
                  hintText: 'Contraseña del usuario',
                  labelText: 'Contraseña',
                  obscureText: true
                ),
                const SizedBox(height: 30),

                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin')
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Superuser')
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer')
                    ),
                    DropdownMenuItem(
                      value: 'Jr. Developer',
                      child: Text('Jr. Developer')
                    )
                  ], 
                  onChanged: (value) => formValues['role'] = value ?? 'Admin',
                  value: 'Admin'
                ),
                const SizedBox(height: 30),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()) {
                      return;
                    }

                    print(formValues);
                  },
                )
              ],
            )
          )
        )
      )
    );
  }
}
