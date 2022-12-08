import 'package:card_animation/UI/component/custom_card.dart';
import 'package:card_animation/UI/component/list_body_component.dart';
import 'package:card_animation/const.dart';
import 'package:flutter/material.dart';

class CustomCardComponent extends StatelessWidget {
  const CustomCardComponent({
    Key? key,
    required this.pageController,
    required this.pageOffset,
    required this.widget,
  }) : super(key: key);

  final PageController pageController;
  final double pageOffset;
  final ListBodyComponent widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color:const Color.fromARGB(255, 88, 69, 69)),
        child: Stack(
          children: [
            PageView.builder(
              itemCount: cards.length,
              controller: pageController,
              itemBuilder: (context, index) => Transform.rotate(
                angle: (-pageOffset + index) / 3,
                child: CustomCard(
                  cardNumber: cards[index]['cardNumber'],
                  gradient: cards[index]['gradient'],
                  size: widget.size,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: SidesBoxes(
                pageController: pageController,
                func: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SidesBoxes(
                pageController: pageController,
                func: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}

class SidesBoxes extends StatelessWidget {
  final void Function()? func;
  final Icon icon;
  const SidesBoxes({
    Key? key,
    required this.pageController,
    this.func,
    required this.icon,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        color: const Color.fromARGB(26, 255, 255, 255),
        height: 200,
        width: 40,
        child: icon,
      ),
    );
  }
}

class CustomWidgetTransaction extends StatelessWidget {
  final String text;
  final Icon leadingIcon;
  const CustomWidgetTransaction({
    Key? key,
    required this.text,
    required this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: size.height * 0.1,
        child: Card(
            color: const Color.fromARGB(223, 255, 253, 253),
            child: ListTile(
              leading: leadingIcon,
              title: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )),
      ),
    );
  }
}
