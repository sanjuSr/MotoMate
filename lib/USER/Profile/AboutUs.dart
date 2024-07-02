import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUs> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "AboutUs",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 480,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("#1",style:TextStyle(
                      fontFamily: 'Schyler2',
                      fontSize: 100,
                      color: Colors.red
                    ),),
                    Text("Two-Wheeler",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Service Providers",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("In The World",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text("We're passionate about keeping your"
                        " ride smooth and safe. Our expert team is "
                        "dedicated to providing top-notch service,"
                        " from regular maintenance to emergency repairs."
                        " With us, you can trust your bike is in good hands."
                        " Convenient booking, reliable technicians,"
                        " and a commitment to excellence -"
                        " that's what sets us apart.",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 15,
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Divider(),
            ),
            SizedBox(height: 10,),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Values",style:TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 45,
                        color: Colors.red,
                    ),),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.red,
                                width: 3
                              )
                            ),
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/passion.jpeg",
                                  height: 120,
                                  width: 120,),
                                Text("Passion",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 25,
                                    color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 5,),
                                Text("Be bold.Love what you do.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("Deliver your best.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.red,
                                    width: 3
                                )
                            ),
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/integrity.jpeg",
                                  height: 120,
                                  width: 120,),
                                Text("Integrity",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 5,),
                                Text("Be ethical and do the right",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("thing, even when no one's",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("watching",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.red,
                                    width: 3
                                )
                            ),
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/respect.jpeg",
                                  height: 120,
                                  width: 120,),
                                Text("Respect",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 5,),
                                Text("Be confident,but humble.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("Appreciate and acknowledge",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("everyone celebratediversity.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.red,
                                    width: 3
                                )
                            ),
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/courage.jpeg",
                                  height: 120,
                                  width: 120,),
                                Text("Courage",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 5,),
                                Text("Take rist and question the",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("status quo.Dare to be different.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.red,
                                    width: 3
                                )
                            ),
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/responsible.jpeg",
                                  height: 120,
                                  width: 120,),
                                Text("Responsible",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 5,),
                                Text("Be caring and accountable to",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("your team, your organization,",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                                Text("society and environment.",style:TextStyle(
                                    fontFamily: 'Schyler2',
                                    fontSize: 15,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 40,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Divider(),
            ),
            Center(
              child: Container(
                width: 300,
                height: 80,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        _launchPlayStoreLogin();
                      },
                      child: Image.asset(
                        "assets/images/playstore.png",
                        height: 150,
                        width: 140,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchAppStoreLogin();
                      },
                      child: Image.asset(
                        "assets/images/apple.png",
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 80,
                child: Row(
                  children: [
                    SizedBox(width: 30,),
                    GestureDetector(
                      onTap: () {
                        _launchInstagramLogin();
                      },
                      child: Image.asset(
                        "assets/images/insta.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      onTap: () {
                        _launchFacebookLogin();
                      },
                      child: Image.asset(
                        "assets/images/face.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      onTap: () {
                        _launchXLogin();
                      },
                      child: Image.asset(
                        "assets/images/x.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Divider(),
            ),
            SizedBox(height: 10,),
            Center(child: Text("Copyright MotoMate pvt Ltd . All Rights Reserved.",
              style:TextStyle(
                  fontFamily: 'Schyler1',
              ),)),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
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

void _launchPlayStoreLogin() async {
  const url = 'https://play.google.com/store/games?hl=en_IN&gl=US&pli=1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchAppStoreLogin() async {
  const url = 'https://www.apple.com/in/app-store/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
