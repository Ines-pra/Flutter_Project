// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:wavel/api/firebaseApi.dart';

// class AddTravel extends StatefulWidget {
//   const AddTravel({Key? key}) : super(key: key);

//   @override
//   State<AddTravel> createState() => _AddTravelState();
// }

// late String _name;
// late String _description;
// late String _date;

// class _AddTravelState extends State<AddTravel> {
//   File? image;

//   @override
//   Widget build(BuildContext context) {
//     final imageName = image != null
//         ? basename(image!.path)
//         : ('Aucune photo selectionnée ! ');

//     Future _envoiDonnees() async {
//       try {
//         FirebaseFirestore.instance
//             .collection('travel')
//             .add({'name': _name, 'description': _description});

//         // final imageName = basename(image!.path);
//         // final destination = 'files/$imageName';

//         // uploadFile(destination, image!);

//         // if (image == null) return;

//         print("Envoi données");
//       } catch (e) {
//         print("Erreur: $e");
//       }
//     }

//     Future _uploadFile() async {
//       try {
//         print('_uploadFile');

//         if (image == null) return;

//         final fileName = basename(image!.path);
//         final destination = 'files/$fileName';

//         FirebaseApi.uploadFile(destination, image!);
//         print('_uploadFile2');
//         // final ref = FirebaseStorage.instance.ref(destination);
//         // ref.putFile(image!);
//         // setState(() {});
//       } catch (e) {
//         print("Erreur _upload: $e");
//       }
//     }

//     Future _selectPicture() async {
//       try {
//         final image =
//             await ImagePicker().pickImage(source: ImageSource.gallery);
//         if (image == null) return;

//         final imagePath = File(image.path);

//         setState(() => {this.image = imagePath});

//         print(imagePath);
//       } on PlatformException catch (e) {
//         print("Erreur: $e");
//       }
//     }

//     return Scaffold(
//         backgroundColor: const Color(0xFFEEEEEE),
//         appBar: AppBar(
//           backgroundColor: const Color(0x7E3474E0),
//           title: const Text("Nouveau voyage "),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
//                 child: Column(
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _name = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Nom',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           onChanged: (value) {
//                             _description = value;
//                           },
//                           obscureText: false,
//                           decoration: const InputDecoration(
//                             hintText: 'Description',
//                           ),
//                           textAlign: TextAlign.start,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: InputDatePickerFormField(
//                           firstDate: DateTime(1900),
//                           lastDate: DateTime(2100),
//                           fieldLabelText: 'Entrez une date',
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             MaterialButton(
//                               minWidth: 170,
//                               height: 40,
//                               color: const Color(0x7E3474E0),
//                               onPressed: _selectPicture,
//                               child: const Text(
//                                 "Ajouter une photo",
//                                 style: TextStyle(
//                                   color: Color(0xFFEEEEEE),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Text(imageName)
//                           ],
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: MaterialButton(
//                           minWidth: 170,
//                           height: 40,
//                           color: const Color(0x7E3474E0),
//                           onPressed: _uploadFile,
//                           child: const Text(
//                             "Envoi photo",
//                             style: TextStyle(
//                               color: Color(0xFFEEEEEE),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: MaterialButton(
//                           minWidth: 170,
//                           height: 40,
//                           color: const Color(0x7E3474E0),
//                           onPressed: _envoiDonnees,
//                           child: const Text(
//                             "Valider",
//                             style: TextStyle(
//                               color: Color(0xFFEEEEEE),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         )),
//                   ],
//                 )),
//           ],
//         )));
//   }
// }

// // UploadTask? uploadFile1(String destination, File file) {
// //   try {
// //     final ref = FirebaseStorage.instance.ref(destination);
// //     print('_uploadFile1');
// //     return ref.putFile(file);
// //   } on FirebaseException catch (e) {
// //     return null;
// //   }
// // }

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:wavel/api/firebaseApi.dart';

class AddTravel extends StatefulWidget {
  @override
  _AddTravelState createState() => _AddTravelState();
}

class _AddTravelState extends State<AddTravel> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x7E3474E0),
        title: const Text("Nouveau voyage "),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 170,
                height: 40,
                color: const Color(0x7E3474E0),
                onPressed: selectFile,
                child: const Text(
                  "Ajouter une photo",
                  style: TextStyle(
                    color: Color(0xFFEEEEEE),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              MaterialButton(
                minWidth: 170,
                height: 40,
                color: const Color(0x7E3474E0),
                onPressed: uploadFile,
                child: const Text(
                  "Envoi photo",
                  style: TextStyle(
                    color: Color(0xFFEEEEEE),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['png', 'jpg']);

      if (result == null) return;
      final path = result.files.single.path!;

      setState(() => file = File(path));
      // final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (file == null) return;

      // final imagePath = File(file.path);

      // setState(() => {this.file = imagePath});

      // print(imagePath);
    } catch (e) {
      print('SelectFile Error : $e');
    }
  }

  Future uploadFile() async {
    try {
      if (file == null) return;

      final fileName = basename(file!.path);
      final destination = 'files/$fileName';

      task = FirebaseApi.uploadFile(destination, file!);
      setState(() {});

      if (task == null) return;

      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      print('Download-Link: $urlDownload');
    } catch (e) {
      print('Upload Error : $e');
    }
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
