// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x7E3474E0),
        body: Center(
            child: Column(
          children: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Text(
                "Help",
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
