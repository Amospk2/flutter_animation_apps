import 'package:flutter/material.dart';

class CustomFunctionCard extends StatelessWidget {
  const CustomFunctionCard(
      {Key? key, required this.size, required this.title, required this.icon})
      : super(key: key);
  final Size size;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: size.width * 0.21,
        child: Card(
          child: Column(
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              icon
            ],
          ),
        ),
      ),
    );
  }
}
