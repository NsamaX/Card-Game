import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/welcome/page.dart';
import 'widget/theme.dart';

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
      debugShowCheckedModeBanner: false,
      theme: themE(),
      home: const welcomE(),
    );
  }
}
