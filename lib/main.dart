import 'package:caferesto/pages/authentification.page.dart';
import 'package:caferesto/pages/coffeepage.dart';
import 'package:caferesto/pages/home.page.dart';
import 'package:caferesto/pages/inscription.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/coffee': (context) => CoffeePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool conn = snapshot.data?.getBool('connecte') ?? false;
            if (conn) return HomePage();
          }
          return AuthentificationPage();
        },
      ),
    );
  }
}
