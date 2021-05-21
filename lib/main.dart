import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thegoodplace/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Unable to Initialize App');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'The Good Place',
            routes: {},
            home: HomeScreen(),
          );
        }
      },
    );
  }
}
