import 'package:flutter/material.dart';
import 'package:project/page/duel/page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(context),
      debugShowCheckedModeBanner: false,
      home: const DuelPage(),
    );
  }
}
