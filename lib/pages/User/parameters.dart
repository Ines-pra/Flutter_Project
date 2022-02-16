import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../login.dart';

class Parameters extends StatefulWidget {
  const Parameters({Key? key}) : super(key: key);

  @override
  State<Parameters> createState() => _ParametersState();
}

late String _donnees;

class _ParametersState extends State<Parameters> {
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Deconnexion");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
      print("Redirection vers la page de login !");
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<void> _envoiDonnees() async {
    try {
      FirebaseFirestore.instance
          .collection('data')
          .add({'text': 'data added through app'});

      print("Envoi données");
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
        // appBar: AppBar(
        //   title: const Text("Home"),
        // ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: MaterialButton(
                minWidth: 170,
                height: 40,
                color: Color(0xFFEEEEEE),
                onPressed: _logout,
                child: const Text(
                  "Se déconnecter",
                  style: TextStyle(
                    color: Color(0xCC3474E0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _donnees = value;
                      },
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'Données',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    MaterialButton(
                      minWidth: 170,
                      height: 40,
                      color: Color(0xFFEEEEEE),
                      onPressed: _envoiDonnees,
                      child: const Text(
                        "Valider",
                        style: TextStyle(
                          color: Color(0xCC3474E0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        )));
  }
}
