import 'package:flutter/material.dart';

class CustomBackgroundForCheckBox extends StatelessWidget {
  final Widget? widget;
  final LinearGradient gradient;
  const CustomBackgroundForCheckBox({
    Key? key,
    this.widget,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: widget,
    );
  }
}

