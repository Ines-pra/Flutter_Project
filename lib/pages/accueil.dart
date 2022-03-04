// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wavel/pages/User/informationsUser.dart';
import 'package:wavel/pages/User/listUser.dart';
import 'Travel/addTravel.dart';
import 'login.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final userMail = user!.email;

    Future<void> _logout() async {
      try {
        await FirebaseAuth.instance.signOut();
        // print("Deconnexion");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
      } on FirebaseAuthException catch (e) {
        print("Erreur: $e");
      } catch (e) {
        print("Erreur: $e");
      }
    }

    Future<void> _wish(id, destination, lienImage) async {
      try {
        FirebaseFirestore.instance.collection('wish').doc(id + userMail).set({
          'id': id,
          'user': userMail,
          'destination': destination,
          'lienImage': lienImage
        });
        // print("New Wish");
      } on FirebaseAuthException catch (e) {
        print("Erreur: $e");
      } catch (e) {
        print("Erreur: $e");
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
            backgroundColor: Colors.teal.shade300,
            title: const Text("Accueil"),
            automaticallyImplyLeading: true),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('travel')
              .where(("user"), isNotEqualTo: userMail)
              .snapshots(),
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
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: IconButton(
                                          icon:
                                              const Icon(Icons.flight_takeoff),
                                          onPressed: () {
                                            _wish(
                                                document.id,
                                                document['destination'],
                                                document['lienImage']);
                                          })),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'By ' + document['pseudo'],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
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
                title: Row(
                  children: const [Icon(Icons.home), Text('  Accueil')],
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Accueil()));
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.people),
                    Text('  Mes informations')
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InformationsUser()));
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.add_circle),
                    Text('  Nouveau voyage')
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddTravel()));
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.directions_walk),
                    Text('  Voyageuses - Voyageurs'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListeUser()));
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.highlight_off),
                    Text('  Déconnexion'),
                  ],
                ),
                onTap: _logout,
              ),
            ],
          ),
        ));
  }
}
