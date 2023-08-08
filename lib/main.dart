import 'package:flutter/material.dart';

import 'screens/splashscreen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      home: screenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
