import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: ImageSlideshow(
          height: 150,
          // indicatorColor: Colors.blue,
          indicatorRadius: 0,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
           autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent[100],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text("Introducing",style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Schyler1'
                      ),),
                      Text("MotoMate",style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Schyler',
                      ),),
                      Text("Services at reasonable",style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontFamily: 'Schyler1'
                      ),),
                      Text("prices.",style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontFamily: 'Schyler1'
                      ),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Image.asset("assets/images/v3.png",height: 130,width: 130,),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Text("Get the most",style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Schyler1'
                      ),),
                      Text("Favourable & appropriate",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Schyler1'
                      ),),
                      Text("Service of your choice",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Schyler1',
                          fontWeight: FontWeight.bold
                      ),),
                      Row(
                        children: [
                          Text("offered by ",style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontFamily: 'Schyler1'
                          ),),
                          Text("MotoMate.",style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler1'
                          ),),
                        ],
                      )
                    ],
                  ),
                  Image.asset("assets/images/engine.png",height: 130,width: 130,),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyanAccent[200],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Text("Guarantee on spares",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Schyler1'
                      ),),
                      Text("The spare parts you ",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Schyler1',
                      ),),
                      Text("select on the app come ",style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontFamily: 'Schyler1'
                      ),),
                      Row(
                        children: [
                          Text("with",style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Schyler1'
                          ),),
                          Text(" guarantee.",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Schyler1'
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Image.asset("assets/images/spare.png",height: 130,width: 130,),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
