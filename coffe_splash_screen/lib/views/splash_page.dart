import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _coffeController;
  bool cropAnimation = false;
  bool animateCofeText = false;

  @override
  void initState() {
    super.initState();
    _coffeController = AnimationController(vsync: this);
    _coffeController.addListener(() {
      if (_coffeController.value > 0.9) {
        _coffeController.stop();
        cropAnimation = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCofeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff632B13),
      body: Stack(
        children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: cropAnimation ? screenHeight * 0.45 : screenHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(cropAnimation ? 40.0 : 0.0))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !cropAnimation,
                  child: Lottie.asset('assets/lottie/lotiecoffe.json', 
                      controller: _coffeController, onLoaded: (composition) {
                    _coffeController
                      ..duration = composition.duration
                      ..forward();
                  }),
                ),
                Visibility(
                  visible: cropAnimation,
                  child: Image.asset(
                    'assets/lottie/coffee2.png',
                    height: 190,
                    width: 190,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCofeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      "C A F É",
                      style:
                          TextStyle(fontSize: 50.0, color: Color(0xff632B13)),
                    ),
                  ),
                )
              ]),
        ),
        Visibility(visible: cropAnimation, child: const _BottomPart())
      ]),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Find The Best Coffee for You',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Lorem ipsum dolor sit amet, adipiscing elit. '
              'Nullam pulvinar dolor sed enim eleifend efficitur.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 85.0),
          ],
        ),
      ),
    );
  }
}
