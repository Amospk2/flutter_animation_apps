import 'package:flutter/material.dart';

import '../widget/positioned_animated.dart';
import 'champ_hability_component.dart';

class BodyContent extends StatelessWidget {
  final double value;
  const BodyContent({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAnimatedPositionedContainer(
          top: 230,
          right: value > 0.3 ? 0 : -150,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Zed Habilitys",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 25,
                  ),
                  ChampHability(
                    habilityKey: "Q",
                    tooltipMessage: "Shuriken Laminado",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ChampHability(
                    habilityKey: "W",
                    tooltipMessage: "Corte Sombrio",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ChampHability(
                    habilityKey: "E",
                    tooltipMessage: "Sombra Viva",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ChampHability(
                    habilityKey: "R",
                    tooltipMessage: "Marca Fatal",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomAnimatedPositionedContainer(
          right: value > 0.3 ? 0 : -150,
          top: 350,
          child: Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Items Iniciais",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 35,
                      ),
                      Tooltip(
                          message: "Broto de Esmagamusgo",
                          child: Image.asset("assets/1103.png")),
                      const SizedBox(
                        width: 15,
                      ),
                      Tooltip(
                          message: "Poção de vida",
                          child: Image.asset("assets/2003.png")),
                      const SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Feitiços de invocador ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Tooltip(
                          message: "Flash",
                          child: Image.asset("assets/SummonerFlash.png")),
                      const SizedBox(
                        width: 15,
                      ),
                      Tooltip(
                        message: "Smite",
                        child: Image.asset("assets/SummonerSmite.png")),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomAnimatedPositionedContainer(
          top: 465,
          right: value > 0.3 ? 0 : -150,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Melhor build",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Image.asset("assets/hidra.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/bot.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/cutelo.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/serilda.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/limear.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/anjo.png"),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
