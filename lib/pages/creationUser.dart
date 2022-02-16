import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wavel/pages/User/parameters.dart';
import 'package:wavel/pages/homepage.dart';
import 'package:wavel/pages/login.dart';

class CreationUser extends StatefulWidget {
  CreationUser({Key? key}) : super(key: key);

  @override
  State<CreationUser> createState() => _CreationUserState();
}

late String _email;
late String _password;

class _CreationUserState extends State<CreationUser> {
  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print("Création d'un utilisateur ok");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Parameters()));
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => Homepage()));
      // print("User: $userCredential");
    } on FirebaseAuthException catch (e) {
      print("Erreur: $e");
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<void> _login() async {
    try {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
      print("Redirection vers la page de login !");
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
        //   title: const Text("Login"),
        // ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
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
                                              'Portail intergallactique',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          //label email
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _email = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Email',
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
                                          //label mot de passe
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 20, 30, 0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                _password = value;
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Mot de passe ',
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 40, 0, 0),
                                            child: MaterialButton(
                                              minWidth: 170,
                                              height: 40,
                                              color: Color(0xCC3474E0),
                                              onPressed: _createUser,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: MaterialButton(
                          minWidth: 170,
                          height: 40,
                          color: Color(0xFFEEEEEE),
                          onPressed: _login,
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(
                              color: Color(0xCC3474E0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
