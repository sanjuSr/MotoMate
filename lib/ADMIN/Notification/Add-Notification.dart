import 'package:bikeserviceapp/ADMIN/Notification/View-Notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {

  final TextEditingController _notificationController = TextEditingController();

  void _addNotification() {
    String notificationText = _notificationController.text.trim();
    if (notificationText.isNotEmpty) {
      FirebaseFirestore.instance.collection('notifications').add({
        'text': notificationText,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Notification added successfully')));
        _notificationController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add notification')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Add Notification",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.redAccent[100],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewNotification()));
                },
                child: Text("View",style: TextStyle(
                fontWeight: FontWeight.bold,
                 color: Colors.redAccent[100],
                  fontSize: 18
                ),)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35,),
            TextFormField(
              maxLength: 25,
              minLines: 5,
              controller: _notificationController,
              decoration: InputDecoration(labelText: 'Notification',
                  border: OutlineInputBorder(borderRadius:
                  BorderRadius.circular(20))
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: ElevatedButton(
                onPressed: _addNotification,
                child: Text('Add Notification',style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
