import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final EdgeInsets? margin;
  final String? Function(String? value)? validator;
  final String? Function()? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const BaseTextField({
    required this.controller,
    required this.text,
    required this.keyboardType,
    this.validator,
    this.margin,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        onTap: onTap,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          labelText: text,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
