import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => homeScreen(),
              ));
        },
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
