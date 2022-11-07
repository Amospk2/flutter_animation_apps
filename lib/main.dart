import 'package:coffee_splash_scree/views/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeSplash());
}

class CoffeSplash extends StatelessWidget {
  const CoffeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
