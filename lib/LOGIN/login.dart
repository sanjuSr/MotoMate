import 'package:bikeserviceapp/ADMIN/admin-home.dart';
import 'package:bikeserviceapp/LOGIN/google-login.dart';
import 'package:bikeserviceapp/REGISTRATION/registration.dart';
import 'package:bikeserviceapp/USER/UserBottomBar.dart';
import 'package:bikeserviceapp/USER/user-home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../COMMON PAGES/SharedPreference.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;

  bool isLoggedIn = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn(BuildContext context) async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in Successful')),
      );

      SharedPrefHelper.setLoginStatus(true);

      if (email == "sanjaymarunnoli161@gmail.com") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else {
        // Navigate to the common home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserBottomBar()),
        );
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  void initState() {
    super.initState();
    autoLogIn();
  }


  void autoLogIn() async {
    bool isLoggedIn = await SharedPrefHelper.getLoginStatus();
    if (isLoggedIn) {
      _navigateToHomepage();
    }
  }

  Future<void> _logout() async {
    await SharedPrefHelper.setLoginStatus(false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _navigateToHomepage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserBottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Lottie.asset('assets/images/login-ani.json'),
                    ),
                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100, top: 260),
                            child: Text(
                              "WELCOME BACK!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                fontFamily: 'Schyler',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: Text(
                              "Login to your existing account",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Schyler',
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () => _signIn(context),
                        child: Text("LOGIN",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),)),
                  ),
                ),
        
                SizedBox(height: 20,),
                GoogleSignInButton(),
        
                SizedBox(height: 20,),
                Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Don't have an account ?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Registration() ));
                      },
                          child: Text("Sign up",
                          style: TextStyle(
                            color: Colors.redAccent[100]
                          ),))
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
