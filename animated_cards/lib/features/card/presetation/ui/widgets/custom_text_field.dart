import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFild extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(String)? callback;
  final void Function()? tapCallback;
  final List<TextInputFormatter>? inputFormatters;
  final int? limiteLength;
  final bool readOnly;
  const CustomTextFild({
    Key? key,
    required this.label,
    this.callback,
    required this.controller,
    this.inputFormatters, this.limiteLength, this.tapCallback, this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
      maxLength: limiteLength,
      onChanged: callback,
      controller: controller,
      onTap: tapCallback,
      readOnly: readOnly,
      decoration: InputDecoration(
        focusColor: Colors.white,
        iconColor: Colors.white,
        hoverColor: Colors.white,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 31, 30, 30)),
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 36, 35, 35)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 8, 8, 8)),
        ),
      ),
    );
  }
}

