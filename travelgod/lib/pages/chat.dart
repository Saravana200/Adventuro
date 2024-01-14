import 'package:travelgod/datatypes/data.dart';
import 'package:travelgod/pages/botNavBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../phoenix/repository.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  bool reply=false;
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [ChatMessage(messageContent: "Hey, it’s great to see you again Mayur. What are you up to?", messageType: "ChatBot")];
  final client= Repository(
    Dio(
      BaseOptions(
        contentType: "application/json",
        baseUrl: "http://10.0.2.2:8000",
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black), // Set arrow color to black
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Chat with Adventuro',
            style: TextStyle(color: Colors.black), // Set text color to black
          ),
          centerTitle: true, // Center the title horizontally
          backgroundColor: Colors.white, // Set background color to white
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("images/Earth_and_Moon-bro.svg"),
          //       fit: BoxFit.cover,
          //     )
          // ),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: ListView.builder(
                  itemCount: _messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10,bottom: 50),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 2),
                      child: Align(
                        alignment: (_messages[index].messageType == "ChatBot"?Alignment.topLeft:Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (_messages[index].messageType  == "ChatBot"?Colors.grey.shade200:const Color(0xFF3FBCB1)),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(_messages[index].messageContent, style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                              hintText: "Tell What Place do you want to vist...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: () {
                          debugPrint("Hellooo");
                          setState(() {
                            _messages.add(ChatMessage(messageContent: _textController.text, messageType: "Sender"));
                            _messages.add(ChatMessage(messageContent: '...', messageType: 'ChatBot'));
                          });
                          client.GetMessage(message: ChatMsg(message: _textController.text)).then((value){
                            print(value.message);
                            setState(() {
                              _messages.removeLast();
                              _messages.add(ChatMessage(messageContent: value.rating, messageType: 'ChatBot'));
                              if(value.best_time!='Best time to visit: nan'){
                                _messages.add(ChatMessage(messageContent: value.best_time, messageType: 'ChatBot'));
                              }
                              value.message.forEach((element) {
                                _messages.add(ChatMessage(messageContent: element.substring(0,100), messageType: 'ChatBot'));
                              });
                            });
                          });
                          _textController.clear();
                        },
                        child: Icon(Icons.send,color: Colors.white,size: 18,),
                        backgroundColor: const Color(0xFF3FBCB1),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
              // BlocBuilder<DataBloc, DataState>(
              //   builder: (context, state) {
              //     if (state is DataLoaded) {
              //       setState(() {
              //         _messages.add(ChatMessage(
              //           messageContent: state.data.res,
              //           messageType: "ChatBot",
              //         ));
              //       });
              //     }
              //     else if(state is DataError){
              //       Fluttertoast.showToast(
              //           msg: "Opps Something went wrong!",
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.CENTER,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.white,
              //           textColor: Colors.black,
              //           fontSize: 16.0
              //       );
              //     }
              //     return SizedBox.shrink(); // This widget doesn't display anything
              //   },
              // ),
            ],
          ),
        ),
    );

  }
  // Future<void> callApi(String msg) async {
  //   try {
  //     final requestData = {
  //       'inputString': msg, // Replace with the actual input data
  //     };
  //     final response = await dio.post('/processData', data: requestData);
  //
  //     if (response.statusCode == 200) {
  //       // API call was successful
  //       // debugPrint("opuhsdf");
  //       // final chatBotResponse = ChatBotResponse.fromJson(response.data);
  //       // // Process the response as needed
  //       // setState(() {
  //       //   _messages.add(ChatMessage(messageContent: chatBotResponse.res, messageType: "ChatBot"));
  //       // });
  //       // print(chatBotResponse);
  //
  //     } else {
  //       // Handle API error (non-200 status code) here
  //       print('API call failed with status code ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Handle network or other errors here
  //     print('Error: $e');
  //   }
  // }

}


class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}