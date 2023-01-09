import 'package:flutter/material.dart';

class BorderBoxWidget extends StatelessWidget {
  final int index;
  final List<int> priorityList;
  const BorderBoxWidget({
    Key? key,
    required this.priorityList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(2),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Text(
        "${priorityList[index]} ${index < (priorityList.length - 1) ? "->" : ""}",
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
