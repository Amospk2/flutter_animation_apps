import 'package:card_animation/UI/component/custom_card_chip.dart';
import 'package:card_animation/UI/widget/custom_circle_widget.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final LinearGradient gradient;
  final String cardNumber;
  const CustomCard({
    Key? key,
    required this.size,
    required this.gradient,
    required this.cardNumber,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: gradient,
      ),
      child: Stack(
        children: [
          const CustomCircleWidget(
            right: 15,
            color: Color.fromARGB(255, 252, 232, 58),
          ),
          const CustomCircleWidget(
            right: 35,
            color: Color.fromARGB(255, 243, 63, 50),
          ),
          const CustomCircleWidget(
            right: 15,
            color: Color.fromARGB(94, 255, 235, 59),
          ),
          const CustomCardChip(),
          Positioned(
            bottom: 30,
            left: 25,
            child: Text(
              cardNumber,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, letterSpacing: 1),
            ),
          )
        ],
      ),
    );
  }
}
