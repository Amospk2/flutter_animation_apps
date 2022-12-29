import 'package:animated_cards/features/card/presetation/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../component/flip_card.dart';
import '../widgets/custom_elevated_button.dart';
import 'create_new_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 201, 194, 194),
        shadowColor: Colors.transparent,
        title: const Text(
          " Manage Yours Cards",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: "Indies",
              fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElevatedButton(
              callback: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateNewCard()));
              },
            ),
          )
        ],
      ),
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (_) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.98,
            child: ListView.builder(
              itemCount: _.cards.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => FlipCard(
                cardModel: _.cards[index],
                size: MediaQuery.of(context).size,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
