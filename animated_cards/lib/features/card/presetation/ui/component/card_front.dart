import 'package:flutter/material.dart';

import '../../../domain/entities/card_model.dart';
import '../widgets/custom_circle_widget.dart';
import 'custom_card_chip.dart';

class CardFront extends StatelessWidget {
  final CardModel card;
  final void Function()? callback;
  const CardFront({
    Key? key,
    required this.size,
    required this.card,
    this.callback,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: card.gradient,
      ),
      child: InkWell(
        onTap: callback,
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
              top: 90,
              left: 80,
              child: Text(
                card.cardNumber,
                style: const TextStyle(
                    color: Colors.white,fontSize: 22, letterSpacing: 1, fontFamily: "Indies"),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 25,
              child: Text(
               card.exp,
                style: const TextStyle(
                    color: Colors.white, fontSize: 16, letterSpacing: 1),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Text(
                card.owner,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: 'Indies'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
