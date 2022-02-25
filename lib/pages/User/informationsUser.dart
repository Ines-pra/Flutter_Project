import 'package:flutter/material.dart';
import 'package:wavel/pages/Others/parameters.dart';

class InformationsUser extends StatefulWidget {
  const InformationsUser({Key? key}) : super(key: key);

  @override
  State<InformationsUser> createState() => _InformationsUserState();
}

class _InformationsUserState extends State<InformationsUser> {
  Future<void> _redirection() async {
    try {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Parameters()));
      print('Redirection vers la liste des utilisateurs !');
    } catch (e) {
      print("Erreur: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x7E3474E0),
        body: Center(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Text(
                "Mes informations",
                style: TextStyle(
                  color: Color(0xCC3474E0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: MaterialButton(
                minWidth: 170,
                height: 40,
                color: const Color(0x7E3474E0),
                onPressed: _redirection,
                child: const Text(
                  "Retour aux paramètres",
                  style: TextStyle(
                    color: Color(0xFFEEEEEE),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
