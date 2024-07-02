import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "ContactUs",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:200,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30,
                right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text("Reach us on",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text("Don't hesitate to contact us"
                        " whether you have a suggesion "
                        "on our improvement, a complaint to "
                        "discuss or an issue to solve.",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 35,),
                GestureDetector(
                  onTap: () {
                    _launchDialer('1234567890');
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.asset("assets/images/call.png",height: 60,width: 60,),
                          SizedBox(height: 5,),
                          Text("Call Us",style:TextStyle(
                              fontFamily: 'Schyler2',
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 5,),
                          Text("Our team is on the line",style:TextStyle(
                              fontFamily: 'Schyler2',
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25,),
                GestureDetector(
                  onTap: () {
                    _launchEmailLogin();
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.asset("assets/images/email.png",height: 60,width: 60,),
                          SizedBox(height: 5,),
                          Text("Email Us",style:TextStyle(
                              fontFamily: 'Schyler2',
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 5,),
                          Text("Our team is online",style:TextStyle(
                              fontFamily: 'Schyler2',
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Contact us in social media",style:TextStyle(
                  fontFamily: 'Schyler2',
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  _launchFacebookLogin();
                },
                child: Row(
                  children: [
                    Image.asset("assets/images/face.png",height: 50,width: 50,),
                    Text("Facebook",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 170,),
                    Icon(CupertinoIcons.arrow_right,color: Colors.redAccent[100],)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Divider(),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  _launchInstagramLogin();
                },
                child: Row(
                  children: [
                    Image.asset("assets/images/insta.png",height: 45,width: 45,),
                    SizedBox(width: 5,),
                    Text("Instgram",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 170,),
                    Icon(CupertinoIcons.arrow_right,color: Colors.redAccent[100],)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Divider(),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  _launchXLogin();
                },
                child: Row(
                  children: [
                    Image.asset("assets/images/x.png",height: 45,width: 45,),
                    SizedBox(width: 5,),
                    Text("X",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 243,),
                    Icon(CupertinoIcons.arrow_right,color: Colors.redAccent[100],)
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}

void _launchEmailLogin() async {
  const url = 'https://mail.google.com/mail/u/0/#inbox';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


void _launchDialer(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


void _launchInstagramLogin() async {
  const url = 'https://www.instagram.com/accounts/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchFacebookLogin() async {
  const url = 'https://www.facebook.com/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchXLogin() async {
  const url = 'https://twitter.com/i/flow/login';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}