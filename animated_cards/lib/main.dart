import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/card/presetation/ui/pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'BankFlutter',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
