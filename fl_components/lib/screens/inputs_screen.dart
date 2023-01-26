import 'package:flutter/material.dart';

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
            children: [
              TextFormField(
                autofocus: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green
                    )
                  ),
                  hintText: 'Nombre del Usuario',
                  helperText: 'Sólo letras',
                  icon: Icon(Icons.assignment_ind_outlined),
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  suffixIcon: Icon(Icons.group_outlined)
                ),
                initialValue: '',
                onChanged: (value) => value,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null) return 'Este campo es requerido';

                  return value.length < 3 ? 'Mínimo de 3 letras' : null;
                },
              )
            ],
          )
        )
      )
    );
  }
}