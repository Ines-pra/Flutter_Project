// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wavel/pages/accueil.dart';

class AddTravel extends StatefulWidget {
  const AddTravel({Key? key}) : super(key: key);

  @override
  State<AddTravel> createState() => _AddTravelState();
}

late String _name;
late String _destination;
late String _description;
late String _date;
late String _lienImage;

class _AddTravelState extends State<AddTravel> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    Future _envoiDonnees() async {
      try {
        final user = auth.currentUser;
        final userMail = user!.email;
        FirebaseFirestore.instance
            .collection("user")
            .where("userMail", isEqualTo: userMail)
            .get()
            .then((querySnapshot) {
          for (var result in querySnapshot.docs) {
            var pseudo = result.get('pseudo');
            FirebaseFirestore.instance.collection('travel').add({
              'user': userMail,
              'pseudo': pseudo,
              'name': _name,
              'description': _description,
              'date': _date,
              'destination': _destination,
              'lienImage': _lienImage
            });
          }
        });

        FirebaseFirestore.instance
            .collection("user")
            .where("userMail", isEqualTo: userMail)
            .get()
            .then((querySnapshot) {
          for (var result in querySnapshot.docs) {
            var nbTravel = result.get('nbTravel');
            FirebaseFirestore.instance
                .collection('user')
                .doc(result.id)
                .update({
              'nbTravel': nbTravel + 1,
            });
          }
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Accueil()));

        // print("Envoi données");
      } catch (e) {
        print("Erreur: $e");
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          // Ancienne couleur : 0x7E3474E0
          backgroundColor: Colors.teal.shade300,
          title: const Text("Nouveau voyage "),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            _name = value;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Titre',
                          ),
                          textAlign: TextAlign.start,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            _destination = value;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Destination',
                          ),
                          textAlign: TextAlign.start,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            _date = value;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Date',
                          ),
                          textAlign: TextAlign.start,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            _description = value;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                          ),
                          textAlign: TextAlign.start,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            _lienImage = value;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Lien vers une image',
                          ),
                          textAlign: TextAlign.start,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MaterialButton(
                          minWidth: 170,
                          height: 50,
                          color: Colors.teal.shade100,
                          onPressed: _envoiDonnees,
                          child: const Text(
                            "Valider",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                )),
          ],
        )));
  }
}
