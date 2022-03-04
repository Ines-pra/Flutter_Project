// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wavel/pages/Travel/listTravel.dart';
import 'package:wavel/pages/Travel/listWishTravel.dart';

class InformationsUser extends StatefulWidget {
  const InformationsUser({Key? key}) : super(key: key);

  @override
  State<InformationsUser> createState() => _InformationsUserState();
}

class _InformationsUserState extends State<InformationsUser> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final userMail = user!.email;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text("Mes informations"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where(("userMail"), isEqualTo: userMail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            // height: 50.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          document['name'] + '  ',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          document['firstname'],
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        'Age : ' + document['age'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'Destination favorite : ' +
                                            document['favoriteDestination'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'Nombre de voyage partagé : ' +
                                            document['nbTravel'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: MaterialButton(
                            minWidth: 170,
                            height: 50,
                            color: Colors.teal.shade100,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ListeTravel()));
                            },
                            child: const Text(
                              "Mes voyages",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: MaterialButton(
                            minWidth: 170,
                            height: 50,
                            color: Colors.teal.shade100,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ListeWishTravel()));
                            },
                            child: const Text(
                              "Mes envies",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ]));
            }).toList(),
          );
        },
      ),
    );
  }
}
