import 'package:flutter/material.dart';
class RecoPage extends StatefulWidget {
  RecoPage({required this.res,super.key});

  String res;

  @override
  State<RecoPage> createState() => _RecoPageState();
}

class _RecoPageState extends State<RecoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Similar Places to visit!"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text(
            widget.res,
          style: TextStyle(
            fontSize: 15
          ),
        ),
      ),
    );
  }
}
