import 'package:animated_cards/features/card/presetation/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_checkbox.dart';

class CheckBoxListThemes extends StatelessWidget {
  const CheckBoxListThemes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: Get.find<MainController>(),
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomBackgroundForCheckBox(
              gradient:_.cards[0].gradient,
              widget: Checkbox(
                value:_.isCheck[0],
                activeColor: Colors.black,
                checkColor: Colors.black,
                fillColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 245, 245, 245)),
                onChanged: (newBool) {
                 _.resetCheckBoxAndSetNewValue(0, newBool);
                },
              ),
            ),
            CustomBackgroundForCheckBox(
              gradient:_.cards[1].gradient,
              widget: Checkbox(
                value:_.isCheck[1],
                activeColor: Colors.black,
                checkColor: Colors.black,
                fillColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 245, 245, 245)),
                onChanged: (newBool) {
                 _.resetCheckBoxAndSetNewValue(1, newBool);
                },
              ),
            ),
            CustomBackgroundForCheckBox(
              gradient:_.cards[2].gradient,
              widget: Checkbox(
                value:_.isCheck[2],
                activeColor: Colors.black,
                checkColor: Colors.black,
                fillColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 245, 245, 245)),
                onChanged: (newBool) {
                 _.resetCheckBoxAndSetNewValue(2, newBool);
                },
              ),
            ),
            CustomBackgroundForCheckBox(
                gradient:_.cards[3].gradient,
                widget: Checkbox(
                  value:_.isCheck[3],
                  activeColor: Colors.black,
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 245, 245, 245)),
                  onChanged: (newBool) {
                   _.resetCheckBoxAndSetNewValue(3, newBool);
                  },
                ))
          ],
        );
      }
    );
  }
}

