import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/card_formatter.dart';
import '../../controllers/main_controller.dart';
import '../widgets/custom_text_field.dart';

class FormItems extends StatelessWidget {
  const FormItems({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: Get.find<MainController>().cardNumber,
            limiteLength: 19,
            label: "Card Number",
            tapCallback: () {
              if (Get.find<MainController>().modelCardModel.isFlip != null) {
                if (Get.find<MainController>().modelCardModel.isFlip!) {
                  Get.find<MainController>()
                      .flipCardWithStateManager(Get.find<MainController>().modelCardModel);
                }
              }
            },
            inputFormatters: [
              CardFormatter(separator: " "),
            ],
            callback: (String value) => Get.find<MainController>().editCardNumber(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: Get.find<MainController>().owner,
            label: "Owner",
            limiteLength: 25,
            tapCallback: () {
              if (Get.find<MainController>().modelCardModel.isFlip != null) {
                if (Get.find<MainController>().modelCardModel.isFlip!) {
                  Get.find<MainController>()
                      .flipCardWithStateManager(Get.find<MainController>().modelCardModel);
                }
              }
            },
            callback: (String value) => Get.find<MainController>().editCardOwner(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: Get.find<MainController>().expDate,
            label: "Expiration Date",
            limiteLength: 5,
            readOnly: true,
            tapCallback: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1999, 01, 01),
                  lastDate: DateTime(2050, 01, 01));
              if (date != null) {
                Get.find<MainController>().expDate.text =
                    "${date.month < 10 ? "0${date.month}" : date.month}/${date.year.toString()[2]}${date.year.toString()[3]}";
              }

              if (Get.find<MainController>().modelCardModel.isFlip != null) {
                if (Get.find<MainController>().modelCardModel.isFlip!) {
                  {
                    Get.find<MainController>()
                        .flipCardWithStateManager(Get.find<MainController>().modelCardModel);
                  }
                }
              }
            },
            callback: (String value) => Get.find<MainController>().editCardExp(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: Get.find<MainController>().cvv,
            limiteLength: 3,
            tapCallback: () {
              if (Get.find<MainController>().modelCardModel.isFlip != null) {
                if (!Get.find<MainController>().modelCardModel.isFlip!) {
                  Get.find<MainController>()
                      .flipCardWithStateManager(Get.find<MainController>().modelCardModel);
                }
              }
            },
            label: "CVV",
            callback: (String value) => Get.find<MainController>().editCardCvv(value),
          ),
        ],
      ),
    );
  }
}
