// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_form/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is Empty';
                    }
                  },
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'username'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value == int) {
                      return 'Field is Empty';
                    }
                  },
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent)),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      checklogin(context);
                    }
                  },
                  child: Text("Login Now"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;

    if (_username == _password) {
      Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => homeScreen()));

      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('savedkey', true);
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.greenAccent,
          margin: EdgeInsets.all(20),
          content: Text(
            "invalid Username And Password",
          )));
    }
  }
}
