import 'package:flutter/material.dart';

class AddTravel extends StatefulWidget {
  const AddTravel({Key? key}) : super(key: key);

  @override
  State<AddTravel> createState() => _AddTravelState();
}

class _AddTravelState extends State<AddTravel> {
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
                "Ajouter un voyages",
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
