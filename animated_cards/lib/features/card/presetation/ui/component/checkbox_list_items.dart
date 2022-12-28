import 'package:flutter/material.dart';

import '../../controllers/main_provider.dart';
import '../widgets/custom_checkbox.dart';

class CheckBoxListThemes extends StatelessWidget {
  const CheckBoxListThemes({
    Key? key,
    required this.mainProvider,
  }) : super(key: key);

  final MainProvider mainProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomBackgroundForCheckBox(
          gradient: mainProvider.cards[0].gradient,
          widget: Checkbox(
            value: mainProvider.isCheck[0],
            activeColor: Colors.black,
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 245, 245, 245)),
            onChanged: (newBool) {
              mainProvider.resetCheckBoxAndSetNewValue(0, newBool);
            },
          ),
        ),
        CustomBackgroundForCheckBox(
          gradient: mainProvider.cards[1].gradient,
          widget: Checkbox(
            value: mainProvider.isCheck[1],
            activeColor: Colors.black,
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 245, 245, 245)),
            onChanged: (newBool) {
              mainProvider.resetCheckBoxAndSetNewValue(1, newBool);
            },
          ),
        ),
        CustomBackgroundForCheckBox(
          gradient: mainProvider.cards[2].gradient,
          widget: Checkbox(
            value: mainProvider.isCheck[2],
            activeColor: Colors.black,
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 245, 245, 245)),
            onChanged: (newBool) {
              mainProvider.resetCheckBoxAndSetNewValue(2, newBool);
            },
          ),
        ),
        CustomBackgroundForCheckBox(
            gradient: mainProvider.cards[3].gradient,
            widget: Checkbox(
              value: mainProvider.isCheck[3],
              activeColor: Colors.black,
              checkColor: Colors.black,
              fillColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 245, 245, 245)),
              onChanged: (newBool) {
                mainProvider.resetCheckBoxAndSetNewValue(3, newBool);
              },
            ))
      ],
    );
  }
}

