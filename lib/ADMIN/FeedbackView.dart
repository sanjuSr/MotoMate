import 'package:bikeserviceapp/ADMIN/admin-home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AdminHome()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Feedbacks",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.redAccent[100],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final feedbackDocs = snapshot.data!.docs;
          if (feedbackDocs.isEmpty) {
            return Center(
              child: Text('No feedback available.'),
            );
          }
          return ListView.builder(
            itemCount: feedbackDocs.length,
            itemBuilder: (context, index) {
              final feedbackData = feedbackDocs[index].data() as Map<String, dynamic>;
              final feedback = feedbackData['feedback'];
              final email = feedbackData['email']; // Retrieve email
              return Column(
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Card(
                        color: Colors.white38,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$email", // Display email
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Schyler1',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "$feedback",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Schyler1',
                                ),
                              ),
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent[100]
                                    ),
                                     onPressed: () async {
                                      await FirebaseFirestore.instance.collection('f').doc().delete();
              },
                                    child: Text("Delete",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),)),
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
