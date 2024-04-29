import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/welcome.dart';
import 'widget/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(project());
}

class project extends StatelessWidget {
  const project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: themeData(),
      home: const welcome(),
    );
  }
}
