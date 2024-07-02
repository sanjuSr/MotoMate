import 'dart:io';
import 'package:bikeserviceapp/ADMIN/Service/Admin-View-Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {

  final TextEditingController servicenameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  File? _selectedImage;

  Future<void> _getImageFromGallery() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void submitService() async {
    if (_selectedImage == null) {
      return;
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Uploaded Succesfully')),
      );
    }

    final imageUrl = await _uploadImageToFirestore();

    await FirebaseFirestore.instance.collection('service').add({
      'service': servicenameController.text,
      'description': descriptionController.text,
      'imageUrl': imageUrl,
      'price': priceController.text,
      'name': nameController.text,
      'timestamp': Timestamp.now(),
    });
  }

  Future<String> _uploadImageToFirestore() async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('service images')
        .child(DateTime.now().toString() + '.jpg');

    await firebaseStorageRef.putFile(_selectedImage!);
    return await firebaseStorageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ServiceAdd()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Add Services",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_selectedImage != null) Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height*0.2,
                  // width: MediaQuery.of(context).size.width*0.04,
                  child: Image.file(_selectedImage!)),
              SizedBox(height: 20,),
              TextField(
                controller: servicenameController,
                decoration: InputDecoration(
                    labelText: 'Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Service Name'),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Description'),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Price'),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.07,
                width: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[100]
                  ),
                  onPressed: _getImageFromGallery,
                  child: Text('Upload Image',
                  style: TextStyle(
                    fontSize: 19,
                      fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Schyler1',
                  ),),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.07,
                width: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[100]
                  ),
                  onPressed: submitService,
                  child: Text('Submit',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Schyler1',
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
