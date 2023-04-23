import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';

class BaseRichText extends StatelessWidget {
  final String baseText;
  final String contentText;

  const BaseRichText({
    required this.baseText,
    required this.contentText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: baseText,
        style: const TextStyle(
          color: secondaryBlue,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: contentText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
