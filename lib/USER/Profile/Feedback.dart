import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();

  Future<void> _submitFeedback() async {
    String feedbackText = _feedbackController.text.trim();
    if (feedbackText.isNotEmpty) {
      try {

        String? userEmail = FirebaseAuth.instance.currentUser?.email;
        if (userEmail != null) {
          await FirebaseFirestore.instance.collection('feedback').add({
            'feedback': feedbackText,
            'email': userEmail,
          });
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Feedback submitted"))
          );
          _feedbackController.clear();
        } else {

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User not authenticated"))
          );
        }
      } catch (error) {

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to submit feedback"))
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty Feedback'),
            content: Text('Please provide feedback before submitting.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent[100],
        title: Text(
          'Feedback',
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Lottie.asset('assets/images/feed.json'),
              ),
              TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Write your feedback here',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[100],
                ),
                onPressed: _submitFeedback,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Schyler1',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
