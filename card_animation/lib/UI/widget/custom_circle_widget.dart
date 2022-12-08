import 'package:flutter/material.dart';

class CustomCircleWidget extends StatelessWidget {
  const CustomCircleWidget({
    Key? key,
    required this.color,
    this.right = 0,
    this.top = 25,
  }) : super(key: key);
  final Color? color;
  final double? right;
  final double? top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: right,
        top: top,
        child: CircleAvatar(
          backgroundColor: color,
          maxRadius: 23,
        ));
  }
}
