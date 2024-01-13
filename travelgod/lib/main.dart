import 'package:flutter/material.dart';
import 'package:travelgod/pages/authSelection.dart';

void main(){
  runApp(MentalHealth());
}

class MentalHealth extends StatelessWidget{
  const MentalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: authSelection(),

    );
  }

}