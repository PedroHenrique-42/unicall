import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final EdgeInsets? margin;
  final String? Function(String? value) validator;

  const BaseTextField({
    required this.validator,
    required this.controller,
    required this.text,
    this.margin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(

        validator:  validator,
        controller: controller,
        decoration: InputDecoration(
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
