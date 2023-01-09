import 'package:flutter/material.dart';

import '../widget/border_box_widget.dart';
import 'champ_hability_component.dart';

class HabilityOrder extends StatelessWidget {
  final double value;
  const HabilityOrder({
    Key? key,
    required this.qPriorityList,
    required this.wPriorityList,
    required this.ePriorityList,
    required this.rPriorityList,
    required this.value,
  }) : super(key: key);

  final List<int> qPriorityList;
  final List<int> wPriorityList;
  final List<int> ePriorityList;
  final List<int> rPriorityList;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: value > 0.3 ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: Container(
        width: 400,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 77, 62, 62),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ChampHability(
                  habilityKey: "Q",
                  tooltipMessage: "Shuriken Laminado",
                ),
                Text(
                  " > ",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                ChampHability(
                  habilityKey: "E",
                  tooltipMessage: "Sombra Viva",
                ),
                Text(
                  " > ",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                ChampHability(
                  habilityKey: "W",
                  tooltipMessage: "Corte Sombrio",
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const ChampHability(
                  habilityKey: "Q",
                  tooltipMessage: "Shuriken Laminado",
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 30,
                      minHeight: 25,
                      maxWidth: 280,
                      minWidth: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: qPriorityList.length,
                    itemBuilder: (context, index) => BorderBoxWidget(
                      priorityList: qPriorityList,
                      index: index,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Row(
              children: [
                const ChampHability(
                  habilityKey: "W",
                  tooltipMessage: "Corte Sombrio",
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 30,
                      minHeight: 25,
                      maxWidth: 280,
                      minWidth: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: wPriorityList.length,
                    itemBuilder: (context, index) => BorderBoxWidget(
                        priorityList: wPriorityList, index: index),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Row(
              children: [
                const ChampHability(
                  habilityKey: "E",
                  tooltipMessage: "Sombra Viva",
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 30,
                      minHeight: 25,
                      maxWidth: 280,
                      minWidth: 200),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ePriorityList.length,
                      itemBuilder: (context, index) => BorderBoxWidget(
                          priorityList: ePriorityList, index: index)),
                )
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Row(
              children: [
                const ChampHability(
                  habilityKey: "R",
                  tooltipMessage: "Marca Fatal",
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 30,
                      minHeight: 25,
                      maxWidth: 280,
                      minWidth: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rPriorityList.length,
                    itemBuilder: (context, index) => BorderBoxWidget(
                        priorityList: rPriorityList, index: index),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
