import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

late String _email;
late String _password;

class _LoginState extends State<Login> {
  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      // print("User: $userCredential");
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      // print("User: $userCredential");
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x7E3474E0),
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration:
                      InputDecoration(hintText: "Entrez votre email..."),
                ),
                TextField(
                  onChanged: (value) {
                    _password = value;
                  },
                  decoration:
                      InputDecoration(hintText: "Entrez un mot de passe... "),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: _login,
                      child: Text("Connexion"),
                    ),
                    MaterialButton(
                      onPressed: _createUser,
                      child: Text("Créer un compte"),
                    )
                  ],
                )
              ],
            )));
  }
}
