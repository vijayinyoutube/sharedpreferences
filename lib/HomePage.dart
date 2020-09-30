import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String name = "User";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Hai., ${(name)}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    saveMyName("vijay");
                  },
                  child: Text(
                    "Save my name",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    removeMyName();
                  },
                  child: Text(
                    "Remove my Name",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    getMyName();
                  },
                  child: Text(
                    "Show my Name",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveMyName(String name) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('name', name);
  }

  Future<void> getMyName() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name') ?? "Name not found";
    });
  }

  Future<void> removeMyName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
  }
}
