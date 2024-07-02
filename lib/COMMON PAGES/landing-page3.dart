import 'package:bikeserviceapp/LOGIN/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
                    "assets/images/landing3.jpg",
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
                          child: Text("Get out &",style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("Ride",style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("A bike service is the perfect",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("way to clear your head and",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("escape from the every grind",style: TextStyle(
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
                            SizedBox(width: 200,),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
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
