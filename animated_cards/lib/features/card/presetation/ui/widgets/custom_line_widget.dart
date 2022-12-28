import 'package:flutter/material.dart';

class CustomLineWidgets extends StatelessWidget {
  const CustomLineWidgets(
      {Key? key, this.left = 0, this.top = 0, this.width, this.height})
      : super(key: key);
  final double? left;
  final double? top;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        color: const Color.fromRGBO(144, 202, 249, 1),
      ),
    );
  }
}

