import 'dart:math';

import 'package:container_animation_ap/constraint.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ContainerAnimation",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);

    _controller.repeat();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.50;
    double height = MediaQuery.of(context).size.height * 0.70;

    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Animated Form",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: darkBlue, boxShadow: [blackshadow]),
                  ),
                  Positioned(
                    top: height / 2,
                    left: width / 2,
                    child: NeonContainerWidget(
                      height: height,
                      width: width,
                      alignment: Alignment.topLeft,
                      animation: _animation,
                      color: const [Colors.transparent, whiteBlue],
                    ),
                  ),
                  Positioned(
                    bottom: height / 2,
                    right: width / 2,
                    child: NeonContainerWidget(
                      height: height,
                      width: width,
                      alignment: Alignment.bottomRight,
                      animation: _animation,
                      color: const [whiteBlue, Colors.transparent],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: height - 25,
                    width: width - 25,
                    decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const SignForm(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignForm extends StatelessWidget {
  const SignForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const CustomTextFild(
          name: "Email",
        ),
        const CustomTextFild(
          name: "Password",
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "forget password",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: whiteBlue,
              padding: const EdgeInsets.symmetric(horizontal: 30)),
          child: const Text(
            "Sign in",
            style: TextStyle(
              fontSize: 15,
              color: darkBlue,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
            'Don\' have an account? ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 12
            ),
          ),
          Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
          ),
          ],
        )
      ],
    );
  }
}

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteBlue,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

class NeonContainerWidget extends StatelessWidget {
  const NeonContainerWidget({
    Key? key,
    required this.animation,
    required this.color,
    required this.alignment, required this.height, required this.width,
  }) : super(key: key);

  final Animation<double> animation;
  final List<Color> color;
  final Alignment alignment;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: alignment,
      angle: animation.value,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: color,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
