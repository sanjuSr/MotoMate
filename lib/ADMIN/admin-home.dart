import 'package:bikeserviceapp/ADMIN/FeedbackView.dart';
import 'package:bikeserviceapp/ADMIN/Notification/Add-Notification.dart';
import 'package:bikeserviceapp/ADMIN/RSA/RSA-Admin-view.dart';
import 'package:bikeserviceapp/ADMIN/Service/Admin-View-Service.dart';
import 'package:bikeserviceapp/ADMIN/UsersDetails.dart';
import 'package:bikeserviceapp/ADMIN/View-Booking.dart';
import 'package:bikeserviceapp/COMMON%20PAGES/SharedPreference.dart';
import 'package:bikeserviceapp/LOGIN/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {


  Future<void> _logout() async {
    await SharedPrefHelper.setLoginStatus(false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Hello Admin",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25),)),
                    content: Text("Are you sure you want to log out?",style: TextStyle(
                      fontSize: 17
                    ),),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.redAccent[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails()));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/user.png",height: 80,width: 80 ,),
                        SizedBox(height: 10,),
                        Text("Users",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler2'
                        ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceAdd() ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/service.png",height: 80,width: 80 ,),
                        SizedBox(height: 10,),
                        Text("Services",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2'
                          ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewBooking() ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/booking.png",height: 80,width: 80 ,),
                        SizedBox(height: 10,),
                        Text("Bookings",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2'
                          ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector (
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RSAAdminView() ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/onroad.png",height: 80,width: 80 ,),
                        SizedBox(height: 10,),
                        Text("Onroad",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2'
                          ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFeedback() ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/feedback.png",height: 80,width: 80 ,),
                        SizedBox(height: 10,),
                        Text("Feedbacks",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2'
                          ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotification() ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/notification.png",height: 80,width: 80 ,),
                        SizedBox(height: 13,),
                        Text("Notification",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2'
                          ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
