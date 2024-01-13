import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelgod/datatypes/test.dart';
import 'package:travelgod/pages/authSelection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelgod/pages/home.dart';
// Import the generated file
import 'firebase_options.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget{
  const MentalHealth({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RedContainerApp(),
      // home: uid==null?authSelection():home(name:'Mayur')
    );
  }

}