import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final EdgeInsets? margin;

  const BaseTextField({
    this.margin,
    required this.controller,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      child: TextFormField(
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
