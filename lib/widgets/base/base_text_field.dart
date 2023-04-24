import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final EdgeInsets? margin;
  final String? Function(String? value) validator;
  final String? Function()? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const BaseTextField({
    required this.validator,
    required this.controller,
    required this.text,
    required this.keyboardType,
    this.margin,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
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
