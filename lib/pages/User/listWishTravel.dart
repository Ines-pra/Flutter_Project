import 'package:flutter/material.dart';

class ListeWishTravel extends StatefulWidget {
  const ListeWishTravel({Key? key}) : super(key: key);

  @override
  State<ListeWishTravel> createState() => _ListeWishTravelState();
}

class _ListeWishTravelState extends State<ListeWishTravel> {
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
                "Liste des voyages souhaités",
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
