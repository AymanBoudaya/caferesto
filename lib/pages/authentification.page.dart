import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;

  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'CafeResto Authentification',
          style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.lock, size: 100),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Bienvenue 👋',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            )),
            TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                  hintText: "Identifiant",
                )),
            SizedBox(height: 20),
            TextFormField(
                obscureText: true,
                controller: txt_password,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.password, color: Colors.black),
                  hintText: "Mot de passe",
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Mot de passe oublié',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(08),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                _Onauthentifier(context);
              },
              child: Text(
                'Connexion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 1,
            ),
            Center(child: Text('Ou continue avec ')),
            SizedBox(height: 2),
            Row(children: []),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              },
              child: Text(
                "Nouveau utilisateur",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _Onauthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String password = prefs.getString("password") ?? '';
    if (txt_login.text == log && txt_password.text == password) {
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(
        content: Text("Nom d'utilisateur et/ou mot de passe incorrect"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
