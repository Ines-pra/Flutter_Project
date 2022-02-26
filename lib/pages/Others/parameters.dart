// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wavel/pages/Others/help.dart';
import 'package:wavel/pages/User/informationsUser.dart';
import 'package:wavel/pages/User/listUser.dart';
import '../login.dart';

class Parameters extends StatefulWidget {
  const Parameters({Key? key}) : super(key: key);

  @override
  State<Parameters> createState() => _ParametersState();
}

class _ParametersState extends State<Parameters> {
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Deconnexion");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
          backgroundColor: const Color(0x7E3474E0),
          title: const Text("Paramètres"),
          automaticallyImplyLeading: true),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: MaterialButton(
              minWidth: 170,
              height: 40,
              color: const Color(0x7E3474E0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InformationsUser()));
              },
              child: const Text(
                "Mes informations",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: MaterialButton(
              minWidth: 170,
              height: 40,
              color: const Color(0x7E3474E0),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ListeUser()));
              },
              child: const Text(
                "Liste des utilisateurs",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: MaterialButton(
              minWidth: 170,
              height: 40,
              color: const Color(0x7E3474E0),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Help()));
              },
              child: const Text(
                "Aide",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: MaterialButton(
              minWidth: 170,
              height: 40,
              color: const Color(0x7E3474E0),
              onPressed: () {
                _logout();
              },
              child: const Text(
                "Déconnexion",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
