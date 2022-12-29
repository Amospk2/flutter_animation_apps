import 'package:animated_cards/features/card/presetation/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'card_back.dart';
import 'card_front.dart';



class FlipCardWithStateManager extends StatefulWidget {


  const FlipCardWithStateManager({Key? key}) : super(key: key);

  @override
  State<FlipCardWithStateManager> createState() => _FlipCardWithStateManagerState();
}

class _FlipCardWithStateManagerState extends State<FlipCardWithStateManager>
    with TickerProviderStateMixin {
  late Animation<double> rotateY;
  late AnimationController animationController;

  late CardFront front;
  late CardBack back;
  final controller = Get.find<MainController>();

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void flipCard() {
    if (controller.modelCardModel.isFlip == null) {
      controller.modelCardModel.isFlip = false;
      controller.modelCardModel.animationController = animationController;
    }
    
    controller.flipCardWithStateManager(controller.modelCardModel);
  }

  @override
  build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.modelCardModel.isFlip = false;
    controller.modelCardModel.animationController = animationController;

    return GetBuilder<MainController>(
      init: controller,
      builder: (_) => AnimatedBuilder(
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
                    child: CardFront(
                      callback: () async {
                        flipCard();
                      },
                      card: controller.modelCardModel,
                      size: size,
                    ),
                  )
                : Transform(
                    transform: transform,
                    alignment: Alignment.center,
                    child: CardBack(
                      callback: () async {
                        flipCard();
                      },
                      card: controller.modelCardModel,
                      size: size,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
