import 'package:bikeserviceapp/COMMON%20PAGES/Brand-Page.dart';
import 'package:bikeserviceapp/USER/ServiceListPage.dart';
import 'package:bikeserviceapp/USER/imageSlider.dart';
import 'package:bikeserviceapp/USER/user-notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "MotoMate",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserNotification() ));
          },
              icon: Lottie.asset('assets/images/notti.json'),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            ImageSlider(),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: Row(
                children: [
                  Text("Brand we serve",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Schyler2',
                      fontSize: 25
                  ),),
                   Spacer(),
                   Hero(
                      tag: 'hero-button',
                      child: SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent[100],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Brands()));
                          },
                          child: Text('We Serve',style: TextStyle(
                            color: Colors.black,
                              fontFamily: 'Schyler2',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                ],
              ),
            ),SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Book Your Service",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Schyler2',
                fontSize: 25
              ),),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width:  MediaQuery.of(context).size.width * 0.43,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceListPage(serviceType: 'Engine'),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white54,
                        child: Column(
                          children: [
                                  Image.asset("assets/images/engine1.png",height: 100,width: 100,),
                                  SizedBox(height: 5,),
                                  Text("Engine",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("Repairing",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),)
                          ],
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width:  MediaQuery.of(context).size.width * 0.43,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceListPage(serviceType: 'Tyre'),
                          ),
                        );
                      },
                      child: Card(
                          color: Colors.white54,
                          child: Column(
                            children: [
                                    SizedBox(height: 10,),
                                    Image.asset("assets/images/tyre.png",height: 90,width: 90,),
                                    SizedBox(height: 5,),
                                    Text("Tyre &",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("Wheel Care",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),)
                            ],
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width:  MediaQuery.of(context).size.width * 0.43,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceListPage(serviceType: 'Battery'),
                          ),
                        );
                      },
                      child: Card(
                          color: Colors.white54,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Image.asset("assets/images/battery1.png",height: 90,width: 100,),
                              SizedBox(height: 5,),
                              Text("Battery",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("Servicce",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width:  MediaQuery.of(context).size.width * 0.43,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceListPage(serviceType: 'Wash'),
                          ),
                        );
                      },
                      child: Card(
                          color: Colors.white54,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Image.asset("assets/images/wash.png",height: 90,width: 90,),
                              SizedBox(height: 5,),
                              Text("Bike",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("Wash",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey
                      ),
                      height: 75,
                      width: 160,
                      child: Stack(
                        children:[ Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/pick.png",height: 65,width: 65,),
                          ],
                        ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50,left: 10),
                            child: Positioned(child:Text("Pickup And Drop",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyler1',
                                fontSize: 16
                            ),), ),
                          )
                       ]
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      height: 70,
                      width: 160,
                      child: Stack(
                          children:[ Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Image.asset("assets/images/settings.png",height: 40,width: 40,),
                            ],
                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 45,left: 10),
                              child: Positioned(child:Text("Genuine Parts",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler1',
                                  fontSize: 16
                              ),), ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      height: 70,
                      width: 160,
                      child: Stack(
                          children:[ Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Image.asset("assets/images/sheild.png",height: 40,width: 40,),
                            ],
                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 45,left: 10),
                              child: Positioned(child:Text("30 Days Warranty",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler1',
                                  fontSize: 16
                              ),), ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      height: 70,
                      width: 160,
                      child: Stack(
                          children:[ Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Image.asset("assets/images/cash.png",height: 40,width: 40,),
                            ],
                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 45,left: 10),
                              child: Positioned(child:Text("Affordable prices",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyler1',
                                  fontSize: 16
                              ),), ),
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
