import 'package:flutter/material.dart';

class ListeTravel extends StatefulWidget {
  const ListeTravel({Key? key}) : super(key: key);

  @override
  State<ListeTravel> createState() => _ListeTravelState();
}

class _ListeTravelState extends State<ListeTravel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x7E3474E0),
        body: Center(
            child: Column(
          children: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Text(
                "Liste des voyages",
                style: TextStyle(
                  color: Color(0xCC3474E0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        )));
  }
}
