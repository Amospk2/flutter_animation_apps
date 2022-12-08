import 'package:card_animation/UI/component/custom_card_component.dart';
import 'package:card_animation/UI/component/list_function_component.dart';
import 'package:flutter/material.dart';

class ListBodyComponent extends StatefulWidget {
  const ListBodyComponent({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<ListBodyComponent> createState() => _ListBodyComponentState();
}

class _ListBodyComponentState extends State<ListBodyComponent> {
  final pageController = PageController(viewportFraction: 0.7);
  double pageOffset = 0;
  int pageC = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        CustomCardComponent(pageController: pageController, pageOffset: pageOffset, widget: widget),
        SizedBox(
          height: 70,
          width: widget.size.width * 0.5,
          child: Card(
            color: const Color.fromARGB(255, 230, 230, 230),
            child: ListFunctionComponent(size: widget.size),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          " Compras",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        const CustomWidgetTransaction(
          text: "18, Setembro, 2022",
          leadingIcon: Icon(Icons.payment),
        ),
        const CustomWidgetTransaction(
          text: "19, Setembro, 2022",
          leadingIcon: Icon(Icons.payment),
        ),
        const CustomWidgetTransaction(
          text: "20, Setembro, 2022",
          leadingIcon: Icon(Icons.payment),
        ),
        const CustomWidgetTransaction(
          text: "21, Setembro, 2022",
          leadingIcon: Icon(Icons.payment),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}

