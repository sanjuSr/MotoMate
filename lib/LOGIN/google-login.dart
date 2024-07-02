
import 'package:bikeserviceapp/USER/UserBottomBar.dart';
import 'package:bikeserviceapp/USER/user-home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return await _auth.signInWithCredential(credential);
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
    return Future.error('Failed to sign in with Google');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
          onPressed: () async {
            await _signInWithGoogle();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>UserBottomBar()));
          },
          child: Row(
            children: [
              SizedBox(width: 60,),
              Text('Sign in with Google',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 10,),
              Image.asset('assets/images/google.png'),
            ],
          ),
        ),
      ),
    );
  }
}