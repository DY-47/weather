// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}
