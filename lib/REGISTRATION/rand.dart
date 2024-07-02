// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ImageUploadPage extends StatefulWidget {
//   const ImageUploadPage({Key? key}) : super(key: key);
//
//   @override
//   State<ImageUploadPage> createState() => _ImageUploadPageState();
// }
//
// class _ImageUploadPageState extends State<ImageUploadPage> {
//   List<String> imageUrls = [];
//   File? imageFile;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserImages();
//   }
//
//   Future<void> _fetchUserImages() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final DocumentSnapshot userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();
//
//       setState(() {
//         imageUrls = List<String>.from(userDoc['imageUrls']);
//       });
//     }
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _uploadImage() async {
//     if (imageFile == null) return;
//
//     try {
//       final Reference ref = FirebaseStorage.instance
//           .ref()
//           .child("profileImage/${DateTime.now().millisecondsSinceEpoch}");
//       final UploadTask uploadTask = ref.putFile(imageFile!);
//
//       uploadTask.whenComplete(() async {
//         final url = await ref.getDownloadURL();
//         print("Image uploaded: $url");
//
//         setState(() {
//           imageUrls.add(url);
//         });
//
//         User? user = FirebaseAuth.instance.currentUser;
//         if (user != null) {
//           final DocumentReference userDoc =
//           FirebaseFirestore.instance.collection('users').doc(user.uid);
//           await userDoc.update({
//             "imageUrls": FieldValue.arrayUnion([url])
//           });
//         }
//       });
//     } catch (e) {
//       print("Error uploading image: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.green.shade900,
//                 radius: 80,
//                 backgroundImage:
//                 imageFile != null ? FileImage(imageFile!) : null,
//                 child: imageFile == null
//                     ? Icon(Icons.person,
//                     color: Colors.greenAccent, size: 50)
//                     : null,
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () => _pickImage(ImageSource.gallery),
//                     child: Icon(Icons.photo_album, color: Colors.green.shade900),
//                   ),
//                   TextButton(
//                     onPressed: () => _pickImage(ImageSource.camera),
//                     child: Icon(Icons.camera, color: Colors.green.shade900),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) =>
//                 //           AllImageShow(imageUrls: imageUrls),
//                 //     ),
//                 //   );
//                 // },
//                 child: Text(
//                   "View Gallery",
//                   style: TextStyle(
//                     color: Colors.green.shade900,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: _uploadImage,
//                 child: Text(
//                   "Upload Image",
//                   style: TextStyle(
//                     color: Colors.green.shade900,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }