// // ignore_for_file: avoid_print
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:wavel/pages/accueil.dart';

// class UpdateInformationsUser extends StatefulWidget {
//   const UpdateInformationsUser({Key? key}) : super(key: key);

//   @override
//   State<UpdateInformationsUser> createState() => _UpdateInformationsUserState();
// }

// late String _name;
// late String _destination;
// late String _description;
// late String _date;
// late String _lienImage;

// class _UpdateInformationsUserState extends State<UpdateInformationsUser> {
//   File? image;

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth auth = FirebaseAuth.instance;

//     Future _updateDonnees() async {
//       try {
//         final user = auth.currentUser;
//         final userMail = user!.email;
//         // FirebaseFirestore.instance.collection('travel').add({
//         //   'user': userMail,
//         //   'name': _name,
//         //   'description': _description,
//         //   'date': _date,
//         //   'destination': _destination,
//         //   'lienImage': _lienImage
//         // });

//         // Navigator.of(context)
//         //     .push(MaterialPageRoute(builder: (context) => const Accueil()));

//         final instance = FirebaseFirestore.instance
//             .collection('user')
//             .where(("userMail"), isEqualTo: userMail)
//             .get();

//         print(instance);

//         // print("Update données");
//       } catch (e) {
//         print("Erreur: $e");
//       }
//     }

//     return Scaffold(
//         backgroundColor: const Color(0xFFEEEEEE),
//         appBar: AppBar(
//           backgroundColor: const Color(0x7E3474E0),
//           title: const Text("Nouveau voyage "),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
//                 child: Column(
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _name = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Nom',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _destination = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Prénom',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _date = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Age',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _description = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Destination favorite',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: MaterialButton(
//                           minWidth: 170,
//                           height: 40,
//                           color: const Color(0x7E3474E0),
//                           onPressed: _updateDonnees,
//                           child: const Text(
//                             "Valider",
//                             style: TextStyle(
//                               color: Color(0xFFEEEEEE),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         )),
//                   ],
//                 )),
//           ],
//         )));
//   }
// }
