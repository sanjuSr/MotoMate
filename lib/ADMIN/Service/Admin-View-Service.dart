import 'package:bikeserviceapp/ADMIN/Service/AddService.dart';
import 'package:bikeserviceapp/ADMIN/admin-home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceAdd extends StatefulWidget {
  const ServiceAdd({super.key});

  @override
  State<ServiceAdd> createState() => _ServiceAddState();
}

class _ServiceAddState extends State<ServiceAdd> {

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
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Services",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AddService()),
                );
              },
              child: Text(
                "Add Service  +",
                style: TextStyle(
                    color: Colors.redAccent[100],
                    fontFamily: 'Schyler1',
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('service').snapshots(),
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
              child: Text('No Service available',),
            );
          }

          var tips = snapshot.data!.docs.where((doc) {
            var data = doc.data() as Map<String, dynamic>;
            return data.containsKey('service') &&
                data.containsKey('description') &&
                data.containsKey('price');
          }).toList();

          if (tips.isEmpty) {
            return Center(
              child: Text('No service available', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Schyler1'
              ),),
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
                    title: Text(data['service'], style: TextStyle(
                        fontFamily: 'Schyle1',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service name:',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyle1',
                          fontSize: 18,
                            color: Colors.black
                        ),),
                        Text('${data['name']}',),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text('Description:',style: TextStyle(
                        fontWeight: FontWeight.bold,
                            fontFamily: 'Schyle1',
                            fontSize: 18,
                            color: Colors.black
                        ),),
                        Text('${data['description']}',),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text('Price:',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyle1',
                            fontSize: 18,
                            color: Colors.black
                        )),
                        Text('${data['price']}'),
                      ],
                    ),
                    leading: data.containsKey('imageUrl') && data['imageUrl'].isNotEmpty
                        ? CachedNetworkImage(
                      imageUrl: data['imageUrl'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => SizedBox.shrink(),
                    )
                        : SizedBox.shrink(),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent[200],size: 30,),
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection('service').doc(tip.id).delete();
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
