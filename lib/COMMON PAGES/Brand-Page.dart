import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Brands",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.redAccent[100],
        leading: Hero(
          tag: 'hero-button',
           child:TextButton(onPressed: (){
             Navigator.of(context).pop();
           }, child: Icon(Icons.arrow_back,color: Colors.black,),)
        ),
      ),
      backgroundColor: Colors.redAccent[100],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/1.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/2.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/3.png'),
                    ),
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/4.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/5.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/6.png'),
                    ),
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/7.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/8.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/9.png'),
                    ),
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/10.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/11.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/12.png'),
                    ),
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/13.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/14.png'),
                    ),
                    height: 120,
                    width: 120,
                  ),Spacer(),
                  SizedBox(
                    child: Card(
                      color: Colors.white70,
                      child: Image.asset('assets/images/15.png'),
                    ),
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
