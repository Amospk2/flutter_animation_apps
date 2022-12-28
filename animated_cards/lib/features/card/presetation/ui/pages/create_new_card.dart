import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_provider.dart';
import '../component/checkbox_list_items.dart';
import '../component/flip_card_model.dart';
import '../component/form_items.dart';

class CreateNewCard extends StatefulWidget {
  const CreateNewCard({Key? key}) : super(key: key);

  @override
  State<CreateNewCard> createState() => _CreateNewCardState();
}

class _CreateNewCardState extends State<CreateNewCard> {
  late MainProvider mainProvider;

  @override
  void dispose() {
    mainProvider.modelCardModel.isFlip = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mainProvider = context.read<MainProvider>();
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
            Consumer(
              builder: (context, value, child) => FlipCardWithProvider(
                cardModel: mainProvider.modelCardModel,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Consumer<MainProvider>(
              builder: (context, value, child) =>
                  CheckBoxListThemes(mainProvider: mainProvider),
            ),
            FormItems(mainProvider: mainProvider),
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
            mainProvider.createNewCard();
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
