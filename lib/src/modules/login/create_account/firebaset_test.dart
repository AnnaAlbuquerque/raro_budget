import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseTests extends StatefulWidget {
  @override
  _FirebaseTestsState createState() => _FirebaseTestsState();
}

class _FirebaseTestsState extends State<FirebaseTests> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("Erro!");
          return Text("Erro!");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("Deu!");
          return Text("Deu!");
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print("Carregando...");
        return Text("Carregando!");
      },
    );
  }
}
