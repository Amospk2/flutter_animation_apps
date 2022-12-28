import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../../domain/entities/card_model.dart';
import '../../controllers/main_provider.dart';
import 'card_back.dart';
import 'card_front.dart';



class FlipCardWithProvider extends StatefulWidget {
  final CardModel cardModel;

  const FlipCardWithProvider({Key? key, required this.cardModel}) : super(key: key);

  @override
  State<FlipCardWithProvider> createState() => _FlipCardWithProviderState();
}

class _FlipCardWithProviderState extends State<FlipCardWithProvider>
    with TickerProviderStateMixin {
  late Animation<double> rotateY;
  late AnimationController animationController;

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

  void flipCard(MainProvider mainProvider) {
    if (mainProvider.modelCardModel.isFlip == null) {
      mainProvider.modelCardModel.isFlip = false;
      mainProvider.modelCardModel.animationController = animationController;
    }

    mainProvider.flipCardWithProvider(mainProvider.modelCardModel);
  }

  @override
  build(BuildContext context) {
    final mainContext = context.read<MainProvider>();
    var size = MediaQuery.of(context).size;
    mainContext.modelCardModel.isFlip = false;
    mainContext.modelCardModel.animationController = animationController;

    return Consumer<MainProvider>(
      builder: (context, value, child) => AnimatedBuilder(
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
                        flipCard(mainContext);
                      },
                      card: widget.cardModel,
                      size: size,
                    ),
                  )
                : Transform(
                    transform: transform,
                    alignment: Alignment.center,
                    child: CardBack(
                      callback: () async {
                        flipCard(mainContext);
                      },
                      card: widget.cardModel,
                      size: size,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
