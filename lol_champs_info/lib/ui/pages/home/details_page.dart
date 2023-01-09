import 'package:flutter/material.dart';
import '../../shared/components/body_content_component.dart';
import '../../shared/components/hability_order.dart';
import '../../shared/components/header_component.dart';
import '../../shared/components/hero_runes.dart';
import '../../shared/components/matchs_component.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final qPriorityList = [1, 4, 5, 7, 9];

  final wPriorityList = [2, 8, 10, 12, 13];

  final ePriorityList = [3, 14, 15, 17, 18];

  final rPriorityList = [6, 11, 16];

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 54, 54),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 580,
                  child: Stack(
                    children: [
                      Container(
                        height: 275,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                          ),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 54, 17, 14),
                            Color.fromARGB(255, 124, 24, 24)
                          ]),
                        ),
                      ),
                      Header(value: controller.value),
                      BodyContent(value: controller.value)
                    ],
                  ),
                ),
                MatchsComponent(value: controller.value),
                HabilityOrder(
                  qPriorityList: qPriorityList,
                  wPriorityList: wPriorityList,
                  ePriorityList: ePriorityList,
                  rPriorityList: rPriorityList,
                  value: controller.value,
                ),
                HeroRunes(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

