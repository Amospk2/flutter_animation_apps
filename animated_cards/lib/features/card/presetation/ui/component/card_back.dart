import 'package:flutter/material.dart';
import '../../../domain/entities/card_model.dart';



class CardBack extends StatelessWidget {
  final CardModel card;
  final void Function()? callback;
  const CardBack({
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
            Container(
              margin: const EdgeInsets.only(top: 25),
              height: 40,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            Positioned(
              right: 25,
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                height: 30,
                width: size.width * 0.50,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Container(
                  margin: const EdgeInsets.only(top: 5, left: 30),
                  child: Transform(
                    transform: Matrix4.rotationY(3.14),
                    child: Text(card.cvv),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: -180,
              child: Transform(
                transform: Matrix4.rotationY(3.14),
                child: Text(
                  card.cardNumber,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
