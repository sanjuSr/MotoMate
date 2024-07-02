import 'package:bikeserviceapp/USER/RSA/RSA-Booking.dart';
import 'package:flutter/material.dart';

class RSA extends StatefulWidget {
  const RSA({super.key});

  @override
  State<RSA> createState() => _RSAState();
}

class CardItem {
  final String imagePath;
  final String description;
  final String additionalText;

  CardItem({
    required this.imagePath,
    required this.description,
    required this.additionalText,
  });
}

class _RSAState extends State<RSA> {
  int selectedValue = 1;

  final Map<int, CardItem> cardItems = {
    1: CardItem(
      imagePath: 'assets/images/onsite.png',
      description: 'On-Site Support',
      additionalText: 'Re-embark on your journey as '
          'soon as possible after the required repairs'
          ' are done on the spot.',
    ),
    2: CardItem(
      imagePath: 'assets/images/key.png',
      description: 'Lost Key Assist',
      additionalText: 'Never lost keys halt your plans again.'
          'Receive a new key in case you have lost the original one.',
    ),
    3: CardItem(
      imagePath: 'assets/images/tyreassist.png',
      description: 'Flat tyre repair',
      additionalText: 'Dont let a flat tyre deflate your plans'
          'with quick assistance and expert care,we`ve got your back.',
    ),
    4: CardItem(
      imagePath: 'assets/images/fuel.png',
      description: 'Shortage of fuel',
      additionalText: 'Fuel your peace of mind with our premimum '
          'emergency fuel delivery.You will receive fuel up to 5 ltrs.',
    ),
    5: CardItem(
      imagePath: 'assets/images/towing.png',
      description: 'Vehicle Towing',
      additionalText: 'With our relible assistance get back on the road'
          'with ease.The towing exceeds 20 kms per KMS cost will be INR 50+GST.',
    ),
    6: CardItem(
      imagePath: 'assets/images/battery.png',
      description: 'Battery Jump-start',
      additionalText: 'Dead batteries are no match for our speedy assistance, ensuring'
          'youre back on the road in no time.',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Roadside Assistance",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                "Two wheeler RSA",
                style: TextStyle(
                  fontFamily: 'Schyler2',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "When you face a breakdown on the road,"
                    " help is just a call away with Roadside"
                    " Assist",
                style: TextStyle(
                  fontFamily: 'Schyler1',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Benefits with RSA",
                style: TextStyle(
                  fontFamily: 'Schyler2',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      children: List.generate(cardItems.length, (index) {
                        int value = index + 1;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          child: Card(
                            color: selectedValue == value ? Colors.redAccent[100] : Colors.white60,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  cardItems[value]!.description,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: selectedValue == value ? Colors.white : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          cardItems[selectedValue]!.imagePath,
                          height: 130,
                        ),
                        SizedBox(height: 10),
                        Text(
                          cardItems[selectedValue]!.additionalText,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Secure your ride with RSA, and do not worry again!"),
              SizedBox(height: 15,),
              Text(
                "Helping hand in just 3 steps",
                style: TextStyle(
                  fontFamily: 'Schyler2',
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Step 1",
                          style: TextStyle(
                              fontFamily: 'Schyler1',
                              color: Colors.red,
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("Raise the incident request by clicking on RSA button in your app.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                          ),)
                      ],
                    ),
                  ),
                  Image.asset("assets/images/click.png",height: 140,width: 125,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Step 2",
                          style: TextStyle(
                              fontFamily: 'Schyler1',
                              color: Colors.red,
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("Our breakdown assistance team will visit you at"
                            " your location to provide necessary assistance.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),)
                      ],
                    ),
                  ),
                  Image.asset("assets/images/team.png",height: 140,width: 125,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Step 3",
                          style: TextStyle(
                              fontFamily: 'Schyler1',
                              color: Colors.red,
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("Your vehicle will be repaired or towed to our service station.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),)
                      ],
                    ),
                  ),
                  Image.asset("assets/images/towing.png",height: 140,width: 125,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("499/- Per vehicle",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RSABooking()));
                        },
                            child: Text("Get Roadside Assistance now",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
