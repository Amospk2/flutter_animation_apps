import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? callback;
  const CustomElevatedButton({
    Key? key, this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 243, 243, 243)),
        foregroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 211, 207, 207)),
        surfaceTintColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 211, 207, 207)),
        elevation: MaterialStateProperty.all(3),
        backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 255, 255, 255)),
        minimumSize: MaterialStateProperty.all(const Size(30, 10)),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2,
          ),
        ),
        shadowColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 26, 25, 25)),
      ),
      child: const Text(
        "+",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
