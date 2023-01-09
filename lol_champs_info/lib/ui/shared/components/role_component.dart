import 'package:flutter/material.dart';

class CustomRoleComponent extends StatelessWidget {
  final String role;
  final BorderRadius borderRadius;
  final bool selected;
  const CustomRoleComponent({
    Key? key,
    required this.role,
    required this.borderRadius,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: selected
              ? const Color.fromARGB(255, 235, 217, 216)
              : const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(children: [
          Image.asset(
            "assets/$role.png",
            fit: BoxFit.contain,
          ),
          Text(
            "$role  ",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800),
          )
        ]),
      ),
    );
  }
}
