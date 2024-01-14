// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
//
import 'package:firebase_auth/firebase_auth.dart';
//
// class UploadingImageToFirebaseStorage extends StatefulWidget
//
// {
//   @override
//   _UploadingImageToFirebaseStorageState createState() =>
//       _UploadingImageToFirebaseStorageState();
// }
//
// class _UploadingImageToFirebaseStorageState extends State<UploadingImageToFirebaseStorage> {
//   File? _imageFile; // Declare _imageFile as nullable
//   final picker = ImagePicker();
//
//   @override
//   void initState() {
//     _imageFile = null; // Initialize with null
//     super.initState();
//   }
//
//   Future pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//         print(_imageFile);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future uploadImageToFirebase() async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     final User? user = auth.currentUser;
//     final String uid = user!.uid;
//     final FirebaseStorage storage = FirebaseStorage.instance;
//     final String imageName = 'images/$uid/${DateTime.now()}.png';
//
//     try {
//       await storage.ref(imageName).putFile(_imageFile!); // Use ! as _imageFile won't be null here
//
//       String downloadURL = await storage.ref(imageName).getDownloadURL();
//       print('Image URL: $downloadURL');
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image to Firebase'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: pickImage,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             if (_imageFile != null)
//               Image.file(_imageFile!, height: 200)
//             else
//               Text('No Image Selected'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: uploadImageToFirebase,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//Caution: Only works on Android & iOS platforms
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

//void main() => runApp(MyApp());




class UploadingImageToFirebaseStorage extends StatefulWidget {
  @override
  _UploadingImageToFirebaseStorageState createState() =>
      _UploadingImageToFirebaseStorageState();
}

class _UploadingImageToFirebaseStorageState extends State<UploadingImageToFirebaseStorage> {
  final Color yellow = Color(0xfffbc31b);
  final Color orange = Color(0xfffb6900);
  File? _imageFile;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
            if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        print(_imageFile);
      } else {
        print('No image selected.');
      }
    });


  }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String fileName = basename(_imageFile.path);
  //   StorageReference firebaseStorageRef =
  //   FirebaseStorage.instance.ref().child('uploads/$fileName');
  //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Done: $value"),
  //   );
  // }
  Future uploadImageToFirebase() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    final FirebaseStorage storage = FirebaseStorage.instance;
    final String imageName = 'images/$uid/${DateTime.now()}.png';

    try {
      await storage.ref(imageName).putFile(_imageFile!); // Use ! as _imageFile won't be null here

      String downloadURL = await storage.ref(imageName).getDownloadURL();
      print('Image URL: $downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [orange, yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Upload a Image',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child:
                          _imageFile != null
                              ? Image.file(_imageFile!)
                              : TextButton(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 50,
                            ),
                            onPressed: pickImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                uploadImageButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [yellow, orange],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: TextButton(
              onPressed: () => uploadImageToFirebase(),
              child: Text(
                "Upload Image",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}