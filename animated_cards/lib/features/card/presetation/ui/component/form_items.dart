import 'package:flutter/material.dart';
import '../../../../../core/utils/card_formatter.dart';
import '../../controllers/main_provider.dart';
import '../widgets/custom_text_field.dart';

class FormItems extends StatelessWidget {
  const FormItems({
    Key? key,
    required this.mainProvider,
  }) : super(key: key);

  final MainProvider mainProvider;

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
            controller: mainProvider.cardNumber,
            limiteLength: 19,
            label: "Card Number",
            tapCallback: () {
              if (mainProvider.modelCardModel.isFlip != null) {
                if (mainProvider.modelCardModel.isFlip!) {
                  mainProvider
                      .flipCardWithProvider(mainProvider.modelCardModel);
                }
              }
            },
            inputFormatters: [
              CardFormatter(separator: " "),
            ],
            callback: (String value) => mainProvider.editCardNumber(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: mainProvider.owner,
            label: "Owner",
            limiteLength: 25,
            tapCallback: () {
              if (mainProvider.modelCardModel.isFlip != null) {
                if (mainProvider.modelCardModel.isFlip!) {
                  mainProvider
                      .flipCardWithProvider(mainProvider.modelCardModel);
                }
              }
            },
            callback: (String value) => mainProvider.editCardOwner(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: mainProvider.expDate,
            label: "Expiration Date",
            limiteLength: 5,
            readOnly: true,
            tapCallback: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2022, 01, 01),
                  firstDate: DateTime(1999, 01, 01),
                  lastDate: DateTime(2050, 01, 01));
              if (date != null) {
                mainProvider.expDate.text =
                    "${date.month < 10 ? "0${date.month}" : date.month}/${date.year.toString()[0]}${date.year.toString()[0]}";
              }

              if (mainProvider.modelCardModel.isFlip != null) {
                if (mainProvider.modelCardModel.isFlip!) {
                  {
                    mainProvider
                        .flipCardWithProvider(mainProvider.modelCardModel);
                  }
                }
              }
            },
            callback: (String value) => mainProvider.editCardExp(value),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFild(
            controller: mainProvider.cvv,
            limiteLength: 3,
            tapCallback: () {
              if (mainProvider.modelCardModel.isFlip != null) {
                if (!mainProvider.modelCardModel.isFlip!) {
                  mainProvider
                      .flipCardWithProvider(mainProvider.modelCardModel);
                }
              }
            },
            label: "CVV",
            callback: (String value) => mainProvider.editCardCvv(value),
          ),
        ],
      ),
    );
  }
}
