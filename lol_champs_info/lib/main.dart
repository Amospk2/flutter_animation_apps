import 'package:flutter/material.dart';

import 'package:lol_champs_info/ui/pages/home/home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const LolChampsApp());
}

class LolChampsApp extends StatelessWidget {
  const LolChampsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
