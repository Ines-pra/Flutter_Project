import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavel/pages/Travel/addTravel.dart';

import 'Travel/listTravel.dart';
import 'User/parameters.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
            backgroundColor: const Color(0x7E3474E0),
            title: const Text("Accueil"),
            automaticallyImplyLeading: true),
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
        //       child: MaterialButton(
        //         minWidth: 170,
        //         height: 40,
        //         color: const Color(0x7E3474E0),
        //         onPressed: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) => const AddTravel()));
        //         },
        //         child: const Text(
        //           "Publier un voyage",
        //           style: TextStyle(
        //             color: Color(0xFFEEEEEE),
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ),

        //   ],
        // ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      height: 50.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        // border: Border.all(
                        //   color: Colors.black,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white]),
                      ),
                      child: Center(child: Text(document['text'])),
                    ));
              }).toList(),
            );
          },
        ),
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
                title: const Text('Voyages'),
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
