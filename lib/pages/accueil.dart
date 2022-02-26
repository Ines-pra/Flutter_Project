// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavel/pages/Travel/listWishTravel.dart';
import 'Travel/addTravel.dart';
import 'Travel/listTravel.dart';
import 'Others/parameters.dart';

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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('travel').snapshots(),
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'By ' + document['user'],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
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
                title: const Text('Liste de mes envies'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListeWishTravel()));
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
