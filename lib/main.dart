// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wavel/pages/accueil.dart';
import 'package:wavel/pages/homepage.dart';
// import 'package:firebase_database/firebase_database.dart';

// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyCTnghQY32rXe4rwNArM91ZsUayZjAdCcw",
      appId: "1:902964315607:web:ac805410b28fbd94a13792",
      messagingSenderId: "902964315607",
      projectId: "flutter-project-44ff9",
      // storageBucket: "gs://flutter-project-44ff9.appspot.com/",
    ),
  );

  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
            child: Text("Erreur: ${snapshot.error} "),
          ));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  Object? user = snapshot.data;

                  if (user == null) {
                    // print(user);
                    return const Homepage();
                  } else {
                    // print(user);
                    // return Homepage();
                    return const Accueil();
                  }
                }

                return const Scaffold(
                  body: Center(
                    child: Text("Checking Authentification "),
                  ),
                );
              });
        }

        return const Scaffold(
          body: Center(child: Text("Connexion ?? l'application...")),
        );
      },
    );
  }
}
