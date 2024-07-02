import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RSAAdminView extends StatefulWidget {
  const RSAAdminView({Key? key});

  @override
  State<RSAAdminView> createState() => _RSAAdminViewState();
}

class _RSAAdminViewState extends State<RSAAdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Get RSA",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('RSABooking').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: null,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final documents = snapshot.data!.docs;

            if (documents.isEmpty) {
              return Center(
                child: Text('No RSA bookings found.'),
              );
            }

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var bookingData = documents[index].data() as Map<String, dynamic>;
                String bookingDocId = documents[index].id;

                return FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('RSABooking').doc(bookingDocId).collection('RSApayment').get(),
                  builder: (context, paymentSnapshot) {
                    if (paymentSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (paymentSnapshot.hasError) {
                      return Text('Error: ${paymentSnapshot.error}');
                    } else {
                      var paymentDocs = paymentSnapshot.data!.docs;

                      // Check if payment document exists
                      if (paymentDocs.isEmpty) {
                        return ListTile(
                          title: Text('Vehicle Number: ${bookingData['vehicleNumber']}'),
                          subtitle: Text('No payment method stored'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () => _deleteBooking(bookingDocId),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RSAPayment(
                                  vehicleNumber: bookingData['vehicleNumber'],
                                  phoneNumber: bookingData['phoneNumber'],
                                  location: bookingData['location'],
                                  complaint: bookingData['complaint'],
                                  paymentMethod: '',
                                ),
                              ),
                            );
                          },
                        );
                      }


                      var paymentData = paymentDocs.first.data() as Map<String, dynamic>;
                      String paymentMethod = paymentData['paymentMethod'];
                      String timestamp = paymentData['timestamp'].toString();

                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Card(
                          color: Colors.white60,
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Vehicle Number:', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyle1',
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('${bookingData['vehicleNumber']}', style: TextStyle(
                                    fontFamily: 'Schyle1',
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(endIndent: 40, color: Colors.black, thickness: 2),
                                Text('Phone Number:', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyle1',
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('${bookingData['phoneNumber']}', style: TextStyle(
                                    fontFamily: 'Schyle1',
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                                Divider(endIndent: 40, color: Colors.black, thickness: 2),
                                Text('Location:', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyle1',
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('${bookingData['location']}', style: TextStyle(
                                    fontFamily: 'Schyle1',
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                                Divider(endIndent: 40, color: Colors.black, thickness: 2),
                                Text('Complaint:', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyle1',
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('${bookingData['complaint']}', style: TextStyle(
                                    fontFamily: 'Schyle1',
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                                Divider(endIndent: 40, color: Colors.black, thickness: 2),
                                Text('Payment Method:', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Schyle1',
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(paymentMethod, style: TextStyle(
                                    fontFamily: 'Schyle1',
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () => _deleteBooking(bookingDocId),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RSAPayment(
                                    vehicleNumber: bookingData['vehicleNumber'],
                                    phoneNumber: bookingData['phoneNumber'],
                                    location: bookingData['location'],
                                    complaint: bookingData['complaint'],
                                    paymentMethod: paymentMethod,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  void _deleteBooking(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('RSABooking').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete booking')),
      );
    }
  }
}

class RSAPayment extends StatelessWidget {
  final String vehicleNumber;
  final String phoneNumber;
  final String location;
  final String complaint;
  final String paymentMethod;


  const RSAPayment({
    Key? key,
    required this.vehicleNumber,
    required this.phoneNumber,
    required this.location,
    required this.complaint,
    required this.paymentMethod,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSA Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vehicle Number: $vehicleNumber'),
            Text('Phone Number: $phoneNumber'),
            Text('Location: $location'),
            Text('Complaint: $complaint'),
            Text('Payment Method: $paymentMethod'),
          ],
        ),
      ),
    );
  }
}
