import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 37, 243),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white, size: 30)),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 33, 37, 243),
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                _Deconnexion(context);
              },
              child: Text(
                'Deconnexion',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
        ),
      ),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(
        context, '/authentification', (route) => false);
  }
}
