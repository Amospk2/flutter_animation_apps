import 'package:card_animation/UI/component/custom_function_card.dart';
import 'package:flutter/material.dart';

class ListFunctionComponent extends StatelessWidget {
  const ListFunctionComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 15,
          ),
          CustomFunctionCard(
            title: "Area Pix",
            icon: const Icon(
              Icons.payment,
              size: 33,
            ),
            size: size,
          ),
          CustomFunctionCard(
            title: "Cartões",
            icon: const Icon(
              Icons.card_giftcard,
              size: 33,
            ),
            size: size,
          ),
          CustomFunctionCard(
            title: "Emprestimo",
            icon: const Icon(
              Icons.money_sharp,
              size: 33,
            ),
            size: size,
          ),
          CustomFunctionCard(
            title: "Outros",
            icon: const Icon(
              Icons.settings_applications,
              size: 33,
            ),
            size: size,
          ),
        ]);
  }
}