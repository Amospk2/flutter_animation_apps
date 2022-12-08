import 'package:card_animation/UI/component/header_component.dart';
import 'package:card_animation/UI/component/list_body_component.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 69, 69),
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: size.height * 0.05,),
                  HeaderComponent(size: size),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: size.height - 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)
                        ),
                        color: Colors.white),
                    child: ListBodyComponent(size: size),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

