import 'package:bikeserviceapp/USER/Booking%20page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class ServiceListPage extends StatelessWidget {
  final String serviceType;

  const ServiceListPage({Key? key, required this.serviceType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$serviceType Services',style: TextStyle(
          fontFamily: 'Schyler',
          fontSize: 30,
        ),),
        backgroundColor: Colors.redAccent[100],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('service')
            .where('service', isEqualTo: serviceType)
            .snapshots(),
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
            return Column(
              children: [
                Center(
                  child:  Lottie.asset('assets/images/nothingfound.json'),
                ),
                Center(
                  child: Text('No services available for $serviceType'),
                ),
              ],
            );
          }

          var services = snapshot.data!.docs;

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              var data = services[index].data() as Map<String, dynamic>;

              return  Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  color: Colors.white70,
                  child: Stack(
                      children:[
                        Column(
                          children: [
                            SizedBox(height: 30,),
                            ListTile(
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${data['name']}', style: TextStyle(
                                    fontFamily: 'Schyler1',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(height: 10,),
                                  Text('${data['description']}'),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent[100],
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    height: MediaQuery.of(context).size.height*0.06,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text('₹ ${data['price']}',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height:40,
                                            child: ElevatedButton(
                                                onPressed: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => BookingPage(
                                                        serviceType: serviceType,
                                                        serviceName: data['name'],
                                                        serviceDescription: data['description'],
                                                        servicePrice: data['price'],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.black
                                                ),
                                                child: Text("Book Now",style: TextStyle(
                                                    color: Colors.redAccent[100],
                                                    fontWeight: FontWeight.bold
                                                ),)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent[100],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text("Free Bike Inspection", style: TextStyle(
                                                fontFamily: 'Schyler1',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ],
                                      ),
                                      height: 30,
                                      width: 155,
                                    ),
                                    SizedBox(width: 80,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 110,
                                        width: 110,
                                        child:  data.containsKey('imageUrl') && data['imageUrl'].isNotEmpty
                                            ? ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => SizedBox.shrink(),
                                          ),
                                        )
                                            : SizedBox.shrink(),
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )
                              ],
                            )
                        )
                      ]
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
