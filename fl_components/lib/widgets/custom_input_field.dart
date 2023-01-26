import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? helperText;
  final String? hintText;
  final IconData? icon;
  final String? labelText;
  final IconData? suffixIcon;

  const CustomInputField({
    super.key,
    this.helperText,
    this.hintText,
    this.icon,
    this.labelText,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        helperText: helperText,
        hintText: hintText,
        icon: icon == null ? null : Icon(icon),
        labelText: labelText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon)
      ),
      initialValue: '',
      onChanged: (value) => value,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';

        return value.length < 3 ? 'Mínimo de 3 letras' : null;
      },
    );
  }

}