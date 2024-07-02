import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminViewPayment extends StatefulWidget {
  const AdminViewPayment({Key? key}) : super(key: key);

  @override
  State<AdminViewPayment> createState() => _AdminViewPaymentState();
}

class _AdminViewPaymentState extends State<AdminViewPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Payments",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('payments').snapshots(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/nothingfound.json'),
                  Text(
                    "Nothing Found",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Schyler1',
                    ),
                  ),
                ],
              ),
            );
          }

          var payments = snapshot.data!.docs;

          return ListView.builder(
            itemCount: payments.length,
            itemBuilder: (context, index) {
              var payment = payments[index];
              var data = payment.data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white38,
                  child: ListTile(
                    title: Text(
                      data['serviceName'],
                      style: TextStyle(
                        fontFamily: 'Schyler2',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler1',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '${data['userName']}',
                            style: TextStyle(
                              fontFamily: 'Schyler1',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Text(
                              'Service: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyler1',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${data['serviceType']}',
                              style: TextStyle(
                                fontFamily: 'Schyler1',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text(
                          'Payment Method: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler1',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${data['paymentMethod']}',
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text(
                          'Payment Time: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler1',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${data['timestamp']}',
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent[200],
                        size: 30,
                      ),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('payments')
                            .doc(payment.id)
                            .delete();
                      },
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
