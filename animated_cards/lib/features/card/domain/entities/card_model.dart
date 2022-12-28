import 'package:flutter/widgets.dart';

class CardModel{
  String cardNumber;
  LinearGradient gradient;
  String cvv;
  String owner;
  String exp;
  AnimationController? animationController;
  bool? isFlip = false;

  CardModel(this.cardNumber, this.gradient, this.cvv, this.owner, this.exp, {this.animationController, this.isFlip});

}