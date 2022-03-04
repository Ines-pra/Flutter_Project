// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListeTravel extends StatefulWidget {
  const ListeTravel({Key? key}) : super(key: key);

  @override
  State<ListeTravel> createState() => _ListeTravelState();
}

class _ListeTravelState extends State<ListeTravel> {
  Future<String?> updateTravel(documentId) async {
    try {
      print('Voyage modifié $documentId');
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => UpdateTravel(documentId)));
    } catch (e) {
      return null;
    }
  }

  Future<String?> deleteTravel(documentId) async {
    try {
      FirebaseFirestore.instance.collection('travel').doc(documentId).delete();
      print('Voyage supprimé $documentId');
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context,document.id) => const UpdateTravel()));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final userMail = user!.email;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
          backgroundColor: const Color(0x7E3474E0),
          title: const Text("Mes voyages"),
          automaticallyImplyLeading: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('travel')
            .where(("user"), isEqualTo: userMail)
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
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    // height: 50.0,
                    // width: 200.0,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document['name'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document['date'] +
                                  '  -  ' +
                                  document['destination'],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              document['description'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  document['lienImage'],
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: MaterialButton(
                                  minWidth: 120,
                                  height: 40,
                                  color: const Color(0xFFEF5350),
                                  onPressed: () {
                                    deleteTravel(document.id);
                                  },
                                  child: const Text(
                                    "Supprimer ?",
                                    style: TextStyle(
                                      color: Color(0xFFEEEEEE),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(12.0),
                              //   child: MaterialButton(
                              //     minWidth: 120,
                              //     height: 40,
                              //     color: const Color(0xFFC5E1A5),
                              //     onPressed: () {
                              //       updateTravel(document.id);
                              //     },
                              //     child: const Text(
                              //       "Modifier ?",
                              //       style: TextStyle(
                              //         color: Colors.black87,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
