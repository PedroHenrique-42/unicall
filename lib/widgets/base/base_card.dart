import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/models/RegisterModel.dart';

class BaseCard extends StatelessWidget {
  final Widget content;
  final double? width;
  final double? height;
  final bool? showActionsBar;
  final RegisterModel? model;

  const BaseCard({
    required this.content,
    this.model,
    this.width,
    this.height,
    this.showActionsBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: primaryYellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
