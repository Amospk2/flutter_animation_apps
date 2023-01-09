import 'package:flutter/material.dart';

class CustomAnimatedPositionedContainer extends StatelessWidget {
  final double? right;
  final double? top;
  final Widget child;
  const CustomAnimatedPositionedContainer({
    Key? key,
    this.right,
    this.top,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 800),
      top: top,
      curve: Curves.fastOutSlowIn,
      right: right,
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 77, 62, 62),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: child,
      ),
    );
  }
}
