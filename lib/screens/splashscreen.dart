import 'package:flutter/material.dart';
import 'package:login_form/screens/loginscreen.dart';

class screenSplash extends StatefulWidget {
  const screenSplash({super.key});

  @override
  State<screenSplash> createState() => _screenSplashState();
}

class _screenSplashState extends State<screenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    screenwait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        child: Image.asset(
          'assets/splash.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> screenwait() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenLogin()));
  }
}
