import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/widgets/base/base_drawer.dart';

class BaseLayout extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final bool? resize;

  const BaseLayout({
    required this.appBarTitle,
    required this.body,
    this.resize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
        primaryBlue,
        secondaryBlue,
      ]),
      resizeToAvoidBottomInset: resize,
      drawer: const BaseDrawer(),
      appBar: AppBar(
        backgroundColor: primaryYellow,
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Center(child: body),
      ),
    );
  }
}
