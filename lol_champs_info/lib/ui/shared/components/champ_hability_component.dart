import 'package:flutter/material.dart';

class ChampHability extends StatelessWidget {
  final String habilityKey;
  final String tooltipMessage;
  const ChampHability({
    Key? key,
    required this.habilityKey,
    required this.tooltipMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: Stack(
        children: [
          Image.asset("assets/Zed$habilityKey.png"),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 97, 95, 95),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white)),
              child: Text(
                habilityKey,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          )
        ],
      ),
    );
  }
}

