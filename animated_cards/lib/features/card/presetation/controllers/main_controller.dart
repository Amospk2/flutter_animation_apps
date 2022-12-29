import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/card_model.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController owner = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  List<bool?> isCheck = [true, false, false, false];

  CardModel modelCardModel = CardModel(
      "",
      const LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 32, 19),
          Color.fromARGB(255, 33, 192, 128)
        ],
      ),
      "",
      "",
      "");
  List<CardModel> cards = [
    CardModel(
        "9874 3654 1247 6254",
        const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 32, 19),
            Color.fromARGB(255, 33, 192, 128)
          ],
        ),
        "098",
        "Amós Cruz Dos Santos",
        "02/23"),
    CardModel(
        "4512 3654 9875 6321",
        const LinearGradient(
          colors: [
            Color.fromARGB(255, 30, 131, 199),
            Color.fromARGB(255, 1, 37, 83)
          ],
        ),
        "456",
        "Amós Cruz Dos Santos",
        "01/25"),
    CardModel(
        "1234 5678 9654 0123",
        const LinearGradient(
          colors: [
            Color.fromARGB(255, 32, 0, 0),
            Color.fromARGB(255, 175, 37, 37)
          ],
        ),
        "123",
        "Amós Cruz Dos Santos",
        "05/26"),
    CardModel(
        "0258 5678 9654 0123",
        const LinearGradient(
          colors: [
            Color.fromARGB(255, 231, 132, 2),
            Color.fromARGB(255, 75, 64, 1)
          ],
        ),
        "954",
        "Amós Cruz Dos Santos",
        "05/30")
  ];

  Future flipCardWithStateManager(CardModel card) async {
    card.isFlip = !(card.isFlip!);
    
    if (card.isFlip!) {
      await card.animationController!.forward();
    } else {
      await card.animationController!.reverse();
    }
    update();
  }

  void editCardNumber(String value) {
    if (value.length <= 19) {
      modelCardModel.cardNumber = cardNumber.text;
    }
    update();
  }

  void editCardOwner(String value) {
    modelCardModel.owner = owner.text;
    update();
  }

  void editCardCvv(String value) {
    modelCardModel.cvv = cvv.text;
    update();
  }

  void editCardExp(String value) {
    modelCardModel.exp = expDate.text;
    update();
  }

  void resetCheckBoxAndSetNewValue(int index, bool? newBool) {
    isCheck = [false, false, false, false];
    isCheck[index] = newBool;
    modelCardModel.gradient = choiceGradient(index);
    update();
  }

  LinearGradient choiceGradient(int index) {
    if (index == 0) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 32, 19),
          Color.fromARGB(255, 33, 192, 128)
        ],
      );
    } else if (index == 1) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 30, 131, 199),
          Color.fromARGB(255, 1, 37, 83)
        ],
      );
    } else if (index == 2) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 32, 0, 0),
          Color.fromARGB(255, 175, 37, 37)
        ],
      );
    } else {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 231, 132, 2),
          Color.fromARGB(255, 75, 64, 1)
        ],
      );
    }
  }

  void createNewCard() {
    if (cardNumber.text != "" &&
        cvv.text != "" &&
        owner.text != "" &&
        expDate.text != "") {
      isCheck.asMap().forEach((key, value) {
        if (value!) {
          cards.add(CardModel(cardNumber.text, choiceGradient(key), cvv.text,
              owner.text, expDate.text));
        }
      });

      resetFields();
    }

    update();
  }

  void resetFields() {
    isCheck = [true, false, false, false];
    cardNumber.text = "";
    owner.text = "";
    expDate.text = "";
    cvv.text = "";

    modelCardModel.cvv = "";
    modelCardModel.gradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 0, 32, 19),
        Color.fromARGB(255, 33, 192, 128)
      ],
    );
    modelCardModel.cardNumber = "";
    modelCardModel.owner = "";
    modelCardModel.exp = "";

    if (modelCardModel.isFlip!) {
      modelCardModel.animationController!.reverse();
    }
  }
}
