import 'package:bikeserviceapp/COMMON%20PAGES/landing-page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LOGIN/login.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              children:[ Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    "assets/images/landing2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                Positioned(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        SizedBox(height: 80,),
                        Row(
                          children: [
                            SizedBox(width: 300,),
                            SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => Login()),
                                    );
                                  },
                                  child: Text("Skip",
                                    style: TextStyle(color: Colors.black),)),
                            ),
                          ],
                        ),
                        SizedBox(height: 350,),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("Affordable",style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("Price",style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("An affordable product or",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("service is one that within",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("most people budget place.",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ),
                        SizedBox(height: 80,),
                        Row(
                          children: [
                            SizedBox(width: 50,),
                            Container(
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 8,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent[100],
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 10,
                              width: 20,
                            ),
                            SizedBox(width: 8,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 200,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Page3() ));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent[100],
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 30,)
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
              ]
          ),
        ],
      ),
    );
  }
}
