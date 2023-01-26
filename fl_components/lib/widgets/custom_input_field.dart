import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String formProperty;
  final Map<String, String> formValues;
  final String? helperText;
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool obscureText;
  final IconData? suffixIcon;

  const CustomInputField({
    super.key,
    required this.formProperty,
    required this.formValues,
    this.helperText,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.labelText,
    this.obscureText = false,
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
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) => formValues[formProperty] = value,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';

        return value.length < 3 ? 'Mínimo de 3 letras' : null;
      },
    );
  }

}