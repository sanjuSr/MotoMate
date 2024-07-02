import 'package:bikeserviceapp/ADMIN/admin-home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "User Details",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AdminHome()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.redAccent[100],
      ),
      // backgroundColor: Colors.white70,
      body: Column(
        children: [
          SizedBox(height: 20,),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text('No users found'),
                );
              }
              return Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        color: Colors.white38,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['name']),
                              SizedBox(
                                child: Divider(
                                  color: Colors.black,
                                ),
                                width: 100,),
                              SizedBox(height: 10,),
                              Text('Email: ${data['email']}',style: TextStyle(
                                fontSize: 17,
                                 fontFamily: 'Schyler1',
                              ),),
                              Text('Phone: ${data['phone']}',style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Schyler1',
                              ),),
                              Text('Address: ${data['address']}',style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Schyler1',
                              ),),
                            ],
                          ),
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30,
                            fontFamily: 'Schyler2',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
