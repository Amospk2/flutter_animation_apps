import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/card_model.dart';
import '../../controllers/main_provider.dart';
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

  void flipCard(MainProvider mainProvider)
  {
    if(mainProvider.cards[widget.index].isFlip == null)
    {
      mainProvider.cards[widget.index].isFlip = false;
      mainProvider.cards[widget.index].animationController = animationController;
    }

    mainProvider.flipCardWithProvider(mainProvider.cards[widget.index]);


  }


  @override
  Widget build(BuildContext context) {
    final mainProvider = context.read<MainProvider>();
    mainProvider.cards[widget.index].animationController = animationController;

    front = CardFront(
      callback: () async {
        flipCard(mainProvider);
      },
      card: widget.cardModel,
      size: widget.size,
    );

    back = CardBack(
      callback: () async {
        flipCard(mainProvider);
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
