import 'package:flutter/material.dart';
import 'package:login_form/screens/home.dart';
import 'package:login_form/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenSplash extends StatefulWidget {
  const screenSplash({super.key});

  @override
  State<screenSplash> createState() => _screenSplashState();
}

class _screenSplashState extends State<screenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    loginshared();
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

  void loginshared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final loggedin = pref.getBool('savedkey');

    if (loggedin == null || loggedin == false) {
      screenwait();
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homeScreen(),
          ));
    }
  }
}
