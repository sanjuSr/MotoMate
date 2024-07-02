import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  final Map<String, dynamic> bookingDetails;

  const BookingDetails({Key? key, required this.bookingDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Booking Details',
          style: TextStyle(
          fontFamily: 'Schyler',
          fontSize: 30,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 400,
                child: Card(
                  child:Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${bookingDetails['serviceName']}',
                      style: TextStyle(
                      fontFamily: 'Schyler2',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                        SizedBox(height: 10,),
                        Text('Model: ',
                          style: TextStyle(
                            fontFamily: 'Schyler2',
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${bookingDetails['vehicleName']}',
                            style: TextStyle(
                              fontFamily: 'Schyler1',
                              fontSize: 18,
                            ),),
                        ),
                        SizedBox(height: 10,),
                        Text('Number: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler2',
                            fontSize: 20,
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${bookingDetails['vehicleNumber']}',
                            style: TextStyle(
                              fontFamily: 'Schyler1',
                              fontSize: 18,
                            ),),
                        ),
                        SizedBox(height: 10,),
                        Text('Complaint: ',
                          style: TextStyle(
                            fontFamily: 'Schyler2',
                            fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${bookingDetails['complaint']}',
                            style: TextStyle(
                              fontFamily: 'Schyler1',
                              fontSize: 18,
                            ),),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Price: ',
                              style: TextStyle(
                                fontFamily: 'Schyler2',
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            Text('${bookingDetails['servicePrice']}',
                              style: TextStyle(
                                fontFamily: 'Schyler1',
                                fontSize: 18,
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Date: ',
                              style: TextStyle(
                                fontFamily: 'Schyler2',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                            Text('${bookingDetails['bookingDate']}',
                              style: TextStyle(
                                fontFamily: 'Schyler1',
                                fontSize: 18,
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Date: ',
                              style: TextStyle(
                                fontFamily: 'Schyler1',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                            Text('${bookingDetails['bookingTime']}',
                              style: TextStyle(
                                fontFamily: 'Schyler1',
                                fontSize: 18,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ) ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
