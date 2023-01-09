import 'package:flutter/material.dart';

class MatchsComponent extends StatelessWidget {
  final double value;
  const MatchsComponent({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: value > 0.3 ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(bottom: 25),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 77, 62, 62),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Forte Contra",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Tooltip(
                      message: "Mordekaiser",
                      child: Image.asset(
                        "assets/Mordekaiser.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Lee Sin",
                      child: Image.asset(
                        "assets/LeeSin.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Hecarim",
                      child: Image.asset(
                        "assets/Hecarim.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Kayn",
                      child: Image.asset(
                        "assets/Kayn.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Lillia",
                      child: Image.asset(
                        "assets/Lillia.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                
                const Text(
                  "Fraco Contra",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Tooltip(
                      message: "Vi",
                      child: Image.asset(
                        "assets/Vi.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Fiddlesticks",
                      child: Image.asset(
                        "assets/Fiddlesticks.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Maokai",
                      child: Image.asset(
                        "assets/Maokai.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "MasterYi",
                      child: Image.asset(
                        "assets/MasterYi.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Tooltip(
                      message: "Elise",
                      child: Image.asset(
                        "assets/Elise.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
