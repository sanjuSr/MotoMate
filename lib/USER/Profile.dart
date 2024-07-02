import 'dart:io';
import 'package:bikeserviceapp/LOGIN/login.dart';
import 'package:bikeserviceapp/USER/Profile/AboutUs.dart';
import 'package:bikeserviceapp/USER/Profile/ContactUs.dart';
import 'package:bikeserviceapp/USER/Profile/Feedback.dart';
import 'package:bikeserviceapp/USER/Profile/MyProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../COMMON PAGES/SharedPreference.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _profileImageUrl;
  String _userName = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final DocumentSnapshot userDoc = await _firestore.collection('user').doc(user.uid).get();
      setState(() {
        _profileImageUrl = userDoc['profileImageUrl'] as String?;
      });
    }
  }

  Future<void> _loadUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('user').doc(user.uid).get();
      String name = userDoc['name'] ?? 'User Name';
      setState(() {
        _userName = name;
        _email = user.email ?? 'Email';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.redAccent[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImageUrl != null && _profileImageUrl!.isNotEmpty
                        ? NetworkImage(_profileImageUrl!)
                        : AssetImage('assets/images/default_avatar.png') as ImageProvider,
                  ),
                  SizedBox(height: 15),
                  Text(
                    _userName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Schyler1',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _email,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(CupertinoIcons.profile_circled, size: 35),
                    SizedBox(width: 20),
                    Text(
                      "My Profile",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.greaterthan, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.phone, size: 35),
                    SizedBox(width: 20),
                    Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.greaterthan, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.feedback, size: 35),
                    SizedBox(width: 20),
                    Text(
                      "Feedback",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.greaterthan, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.warning, size: 35),
                    SizedBox(width: 20),
                    Text(
                      "About Us",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.greaterthan, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      content: Text(
                        "Are you sure you want to log out?",
                        style: TextStyle(fontSize: 17),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Logout"),
                          onPressed: () async {
                            await SharedPrefHelper.setLoginStatus(false);
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.logout, size: 35),
                    SizedBox(width: 20),
                    Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.greaterthan, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }
}
