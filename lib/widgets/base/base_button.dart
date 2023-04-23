import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final void Function() function;

  const BaseButton(this.text, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryBlue,
      ),
      // onPressed: () {
      //   Navigator.pushNamed(context, "/telaCadastro");
      // },
      onPressed: function,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
