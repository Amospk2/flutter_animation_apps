import 'package:flutter/material.dart';

import '../widgets/custom_line_widget.dart';

class CustomCardChip extends StatelessWidget {
  const CustomCardChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Card(
          color: const Color.fromARGB(255, 221, 218, 136),
          child: Stack(
            children: const [
              CustomLineWidgets(
                left: 20,
                height: 50,
                width: 1,
              ),
              CustomLineWidgets(
                top: 15,
                height: 1,
                width: 20,
              ),
              CustomLineWidgets(
                top: 30,
                height: 1,
                width: 20,
              ),
              CustomLineWidgets(
                top: 10,
                left: 20,
                height: 1,
                width: 50,
              ),
              CustomLineWidgets(
                left: 20,
                top: 23,
                height: 1,
                width: 50,
              ),
              CustomLineWidgets(
                left: 20,
                top: 35,
                height: 1,
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

