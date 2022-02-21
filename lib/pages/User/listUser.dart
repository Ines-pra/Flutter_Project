import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ListeUser extends StatefulWidget {
  const ListeUser({Key? key}) : super(key: key);

  @override
  State<ListeUser> createState() => _ListeUserState();
}

// FirebaseFirestore _firestore = FirebaseFirestore.instance;
// CollectionReference datas = FirebaseFirestore.instance.collection('data');

// Future<List<dynamic>> get userList async {
//  QuerySnapshot querySnapshot =
//     await FirebaseFirestore.instance.collection('listOfUsers').get();

//   final allData = querySnapshot.docs.map((doc) => doc.get('email')).toList();
//   return allData;
// }

class _ListeUserState extends State<ListeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x7E3474E0),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Text(
                "Liste des utilisateurs",
                style: TextStyle(
                  color: Color(0xCC3474E0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // StreamBuilder(
            //   stream: FirebaseFirestore.instance.collection('data').snapshots(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (!snapshot.hasData) {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }

            //     return ListView(
            //       children: snapshot.data!.docs.map((document) {
            //         return Container(
            //           child: Center(child: Text(document['text'])),
            //         );
            //       }).toList(),
            //     );
            //   },
            // ),
          ],
        )));
  }
}
