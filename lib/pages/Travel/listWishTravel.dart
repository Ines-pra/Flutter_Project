// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavel/pages/Others/help.dart';
import 'package:wavel/pages/User/listUser.dart';

class ListeWishTravel extends StatefulWidget {
  const ListeWishTravel({Key? key}) : super(key: key);

  @override
  State<ListeWishTravel> createState() => _ListeWishTravelState();
}

class _ListeWishTravelState extends State<ListeWishTravel> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final userMail = user!.email;

    Future<String?> deleteWishTravel(documentId) async {
      try {
        FirebaseFirestore.instance.collection('wish').doc(documentId).delete();
        print('Voyage supprimé $documentId');
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context,document.id) => const UpdateTravel()));
      } catch (e) {
        return null;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
          backgroundColor: const Color(0x7E3474E0),
          title: const Text("Mes envies"),
          automaticallyImplyLeading: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('wish')
            .where('user', isEqualTo: userMail)
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document['destination'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                                    deleteWishTravel(document.id);
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
