import 'package:flutter/material.dart';

class HeroRunes extends StatelessWidget {
  const HeroRunes({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: controller.value > 0.3 ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: Container(
            width: 300,
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 77, 62, 62),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                const Text(
                  "Precisão",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      message: "Conquistador",
                      child: Image.asset(
                        'assets/Conqueror.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Tooltip(
                      message: "Presença de Espirito",
                      child: Image.asset(
                        'assets/PresenceOfMind.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Tooltip(
                      message: "Lenda: Tenacidade",
                      child: Image.asset(
                        'assets/LegendTenacity.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Tooltip(
                      message: "Até a morte",
                      child: Image.asset(
                        'assets/LastStand.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Feiticaria",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      message: "Manto de Nimbus",
                      child: Image.asset(
                        'assets/6361.png',
                        fit: BoxFit.contain,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Tooltip(
                      message: "Transcendência",
                      child: Image.asset(
                        'assets/Transcendence.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
