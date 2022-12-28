import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/card/presetation/controllers/main_provider.dart';
import 'features/card/presetation/ui/pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (contenxt) => MainProvider(),
      )
    ],
    child: const CardApp(),
  ));
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BankFlutter',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
