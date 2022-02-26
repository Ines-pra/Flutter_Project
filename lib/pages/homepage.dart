// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'creationUser.dart';
import 'login.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> _login() async {
    try {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));
      print("Redirection vers la page de login !");
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<void> _createUser() async {
    try {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const CreationUser()));
      print('Redirection vers la page de connexion !');
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x7E3474E0),
      // appBar: AppBar(
      //   title: const Text("Home"),
      // ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Image.asset(
                'assets/images/logo_wavel.png',
                height: 225,
                width: 225,
              ),

              // Text(
              //   "Homepage",
              //   style: TextStyle(
              //     color: Color(0xCC3474E0),
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            ),
            Padding(
              // padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              padding: const EdgeInsets.all(20),
              child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    color: Colors.transparent)),
                            minWidth: 170,
                            height: 40,
                            color: const Color(0xFFEEEEEE),
                            onPressed: _login,
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                color: Color(0xCC3474E0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          minWidth: 170,
                          height: 40,
                          color: const Color(0xFFEEEEEE),
                          onPressed: _createUser,
                          child: const Text(
                            "S'enregistrer",
                            style: TextStyle(
                              color: Color(0xCC3474E0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ]),
    );
  }
}
