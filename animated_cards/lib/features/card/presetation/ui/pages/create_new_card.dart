import 'package:animated_cards/features/card/presetation/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/checkbox_list_items.dart';
import '../component/flip_card_model.dart';
import '../component/form_items.dart';

class CreateNewCard extends StatefulWidget {
  const CreateNewCard({Key? key}) : super(key: key);

  @override
  State<CreateNewCard> createState() => _CreateNewCardState();
}

class _CreateNewCardState extends State<CreateNewCard> {
  final controller = Get.find<MainController>();


  @override
  void dispose() {
    controller.resetFields();
    controller.modelCardModel.isFlip = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          " Create New Cards",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: "Indies",
              fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GetBuilder<MainController>(
              init: controller,
              builder: (_) => const FlipCardWithStateManager(
              ),
            ),
            const SizedBox(
              height: 25,
            ),
           GetBuilder<MainController>(
              init: controller,
              builder: (_) =>
                  const CheckBoxListThemes(),
            ),
            const FormItems(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 243, 243, 243)),
            foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 211, 207, 207)),
            surfaceTintColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 211, 207, 207)),
            elevation: MaterialStateProperty.all(3),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
            minimumSize: MaterialStateProperty.all(const Size(30, 10)),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 2,
              ),
            ),
            shadowColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 26, 25, 25)),
          ),
          onPressed: () {
            Get.find<MainController>().createNewCard();
          },
          child: const Text(
            "+",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
