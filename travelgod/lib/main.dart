import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelgod/datatypes/test.dart';
import 'package:travelgod/pages/authSelection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelgod/pages/home.dart';
import 'package:travelgod/pages/imageUpload.dart';
// Import the generated file
import 'firebase_options.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

<<<<<<< Updated upstream

  runApp(adventuro());
}

class adventuro extends StatelessWidget{
  const adventuro({Key? key}) : super(key: key);
=======
  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget{
  const MentalHealth({Key? key}) : super(key: key);
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    String? name;
    if(uid!=null){
      getUser().then((value){
        name = value;
        print(name);
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RedContainerApp(),
<<<<<<< Updated upstream
      home: uid==null?authSelection():home()
=======
      home: uid==null?authSelection():home(name:name)
>>>>>>> Stashed changes
    );
  }

}
Future<String?> getUser()async{
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final user = await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value){
    print(value.data());
  });
  return " ";
}