import 'package:flutter/material.dart';
import 'package:login_form/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text("Jassim"),
                        subtitle: Text("Active 2 minutes Ago"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                          radius: 30,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            signout(context);
          },
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.greenAccent,
        ),
      ),
    );
  }

  void signout(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ),
        (route) => false);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
