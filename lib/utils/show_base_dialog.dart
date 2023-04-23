import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';

Future<bool> showBaseDialog(BuildContext context, String title) async {
  bool value = true;

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      backgroundColor: primaryYellow,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text("Sim", style: Theme.of(context).textTheme.titleLarge),
          icon: const Icon(Icons.check, color: primaryGreen),
        ),
        TextButton.icon(
          onPressed: () {
            value = false;
            Navigator.pop(context);
          },
          label: Text("Não", style: Theme.of(context).textTheme.titleLarge),
          icon: const Icon(Icons.close, color: primaryRed),
        ),
      ],
    ),
  );

  return value;
}
