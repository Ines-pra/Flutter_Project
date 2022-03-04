// ignore_for_file: avoid_print
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wavel/pages/accueil.dart';

class AddInformationsUser extends StatefulWidget {
  const AddInformationsUser({Key? key}) : super(key: key);

  @override
  State<AddInformationsUser> createState() => _AddInformationsUserState();
}

late String _pseudo;
late String _name;
late String _firstname;
late String _age;
late String _favoriteDestination;

class _AddInformationsUserState extends State<AddInformationsUser> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _addInformation() async {
    try {
      final user = auth.currentUser;
      final userMail = user!.email;

      final DocumentReference documentReference =
          await FirebaseFirestore.instance.collection('user').add({
        'id': "",
      });

      final String _id = documentReference.id;
      FirebaseFirestore.instance.collection('user').doc(_id).set({
        'userMail': userMail,
        'pseudo': _pseudo,
        'name': _name,
        'firstname': _firstname,
        'age': _age,
        'favoriteDestination': _favoriteDestination,
        'id': _id
      });
      print("Ajout des informations d'un utilisateur ok");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Accueil()));
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
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color(0x80050505),
                                  spreadRadius: 5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //titre
                                  Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 40),
                                            child: Text(
                                              'Compléter vos informations',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),

                                          //label pseudo
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _pseudo = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Pseudo',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),

                                          //label nom
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _name = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Nom',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          //label prenom
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _firstname = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Prénom',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          //age
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _age = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Age',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          //destination préféré
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _favoriteDestination = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Destination préférée',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x4D050505),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          //bouton connexion
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 40, 0, 0),
                                            child: MaterialButton(
                                              minWidth: 170,
                                              height: 50,
                                              color: const Color(0xCC3474E0),
                                              onPressed: _addInformation,
                                              child: const Text(
                                                "Créer",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ]),
                          )),
                    ]))));
  }
}
