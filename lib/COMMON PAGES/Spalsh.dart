import 'dart:async';
import 'package:bikeserviceapp/COMMON%20PAGES/SharedPreference.dart';
import 'package:bikeserviceapp/USER/UserBottomBar.dart';
import 'package:flutter/material.dart';

import 'landing-page1.dart';

class Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  void _startSplashScreenTimer() {
    Timer(Duration(seconds: 3), _navigateBasedOnLoginStatus);
  }

  void _navigateBasedOnLoginStatus() async {
    bool isLoggedIn = await SharedPrefHelper.getLoginStatus();
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UserBottomBar()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Page1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 124, 8, 72),
        body: Container(
            decoration: BoxDecoration(),
            child:  Center(
              child: SizedBox(
                  // height: MediaQuery.of(context).size.height/1.8,
                  // width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset("assets/images/splash.jpeg",
                      fit: BoxFit.cover,
                     ),
                  )),
            )
        ),
      ),
    );
  }
}