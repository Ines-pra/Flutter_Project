import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavel/pages/Others/help.dart';
import 'package:wavel/pages/Travel/addTravel.dart';
import 'package:wavel/pages/User/informationsUser.dart';
import 'package:wavel/pages/Travel/listTravel.dart';
import 'package:wavel/pages/User/listUser.dart';
import 'package:wavel/pages/accueil.dart';
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
          .push(MaterialPageRoute(builder: (context) => Login()));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListeUser()));
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0x7E3474E0),
                ),
                child: Text(
                  'Wavel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Accueil'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Accueil()));
                },
              ),
              ListTile(
                title: const Text('Partager un nouveau voyage'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddTravel()));
                },
              ),
              ListTile(
                title: const Text('Mes Voyages'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListeTravel()));
                },
              ),
              ListTile(
                title: const Text('Paramètres'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Parameters()));
                },
              ),
            ],
          ),
        ));
  }
}
