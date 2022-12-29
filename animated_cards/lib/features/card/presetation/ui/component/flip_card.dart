import 'package:animated_cards/features/card/presetation/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/card_model.dart';
import 'card_back.dart';
import 'card_front.dart';
import 'dart:math' as math;


class FlipCard extends StatefulWidget {
  final CardModel cardModel;
  final int index;
  final Size size;

  const FlipCard(
      {Key? key,
      required this.cardModel,
      required this.index,
      required this.size})
      : super(key: key);

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late Animation<double> rotateY;
  late AnimationController animationController;
  bool isfront = true;

  late CardFront front;
  late CardBack back;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void flipCard()
  {
    if(Get.find<MainController>().cards[widget.index].isFlip == null)
    {
      Get.find<MainController>().cards[widget.index].isFlip = false;
      Get.find<MainController>().cards[widget.index].animationController = animationController;
    }

    Get.find<MainController>().flipCardWithStateManager(Get.find<MainController>().cards[widget.index]);


  }


  @override
  Widget build(BuildContext context) {
    Get.find<MainController>().cards[widget.index].animationController = animationController;

    front = CardFront(
      callback: () async {
        flipCard();
      },
      card: widget.cardModel,
      size: widget.size,
    );

    back = CardBack(
      callback: () async {
        flipCard();
      },
      card: widget.cardModel,
      size: widget.size,
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final angle = animationController.value * -math.pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY(angle);
        return Transform.rotate(
          angle: 0.1,
          child: animationController.value <= 0.5
              ? Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: front,
                )
              : Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: back,
                ),
        );
      },
    );
  }
}
