import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool cropAnimation = false;
  bool changeLayout = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff632B13),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: cropAnimation ? 100 : 250,
            height: cropAnimation ? 100 : 50,
            width: cropAnimation ? 50 : 100,
            right: cropAnimation ? 0 : screenWidth / 2 - 50,
            onEnd: () {
              setState(() {
                changeLayout = !changeLayout;
              });
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  cropAnimation = !cropAnimation;
                  changeLayout = !changeLayout;
                });
              },
              child: changeLayout
                  ? AnimatedOpacity(
                      opacity: changeLayout ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: Column(children: const [
                        Icon(Icons.home),
                        Icon(Icons.home)
                      ]),
                    )
                  : AnimatedOpacity(
                      opacity: changeLayout ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: Column(children: const [
                        Icon(Icons.home),
                        Icon(Icons.home)
                      ]),
                    )
            ),
          ),
        ],
      ),
    );
  }
}
