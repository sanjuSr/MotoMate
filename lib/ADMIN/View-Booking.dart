import 'package:bikeserviceapp/ADMIN/ViewPayment.dart';
import 'package:flutter/material.dart';
import 'package:bikeserviceapp/ADMIN/Service/AddService.dart';
import 'package:bikeserviceapp/ADMIN/admin-home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';


class AdminViewBooking extends StatefulWidget {
  const AdminViewBooking({super.key});

  @override
  State<AdminViewBooking> createState() => _AdminViewBookingState();
}

class _AdminViewBookingState extends State<AdminViewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AdminHome()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewPayment() ));
            },
                child: Text("Payments",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.redAccent[100]
                ),)),
          )
        ],
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Bookings",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No Bookings available',),
            );
          }

          var tips = snapshot.data!.docs.where((doc) {
            var data = doc.data() as Map<String, dynamic>;
            return data.containsKey('userName') &&
                data.containsKey('serviceType') &&
                data.containsKey('complaint');
          }).toList();

          if (tips.isEmpty) {
            return Column(
                children:[ Center(
                    child: Lottie.asset('assets/images/nothingfound.json')
                ),
                  Center(
                    child: Text("Nothing Found",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Schyler1'
                    ),),
                  )
                ]
            );
          }

          return ListView.builder(
            itemCount: tips.length,
            itemBuilder: (context, index) {
              var tip = tips[index];
              var data = tip.data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  color: Colors.white38,
                  child: ListTile(
                    title: Text(data['userName'], style: TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Service :',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                              color: Colors.black
                            ),),
                            Text(' ${data['serviceType']}',style: TextStyle(
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text('Complaint :',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyle1',
                            fontSize: 18,
                            color: Colors.black
                        ),),
                        Text('${data['complaint']}',style: TextStyle(
                        fontFamily: 'Schyle1',
                            fontSize: 18,
                            color: Colors.black
                        ),),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Text('Model :',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                            Text(' ${data['vehicleName']}',style: TextStyle(
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Text('Number :',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                            Text(' ${data['vehicleNumber']}',style: TextStyle(
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Text('Date :',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                            Text('${data['bookingDate']}'),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Text('Time :',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyle1',
                                fontSize: 18,
                                color: Colors.black
                            ),),
                            Text('${data['bookingTime']}'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent[200],size: 30,),
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection('bookings').doc(tip.id).delete();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
