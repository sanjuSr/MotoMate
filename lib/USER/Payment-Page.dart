import 'package:bikeserviceapp/USER/UserBottomBar.dart';
import 'package:bikeserviceapp/USER/user-home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this for Firebase

class PaymentPage extends StatefulWidget {
  final Map<String, dynamic> bookingDetails;

  const PaymentPage({Key? key, required this.bookingDetails}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentOption;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.redAccent[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white70,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.bookingDetails['serviceName']}',
                        style: TextStyle(
                          fontFamily: 'Schyler1',
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Service Description :',
                        style: TextStyle(
                            fontFamily: 'Schyler1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${widget.bookingDetails['serviceDescription']}',
                          style: TextStyle(
                            fontFamily: 'Schyler1',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Disclaimer: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Price may vary according to service",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        color: Colors.redAccent[100],
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price (incl. of taxes):',
                                style: TextStyle(
                                  fontFamily: 'Schyler1',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '₹${widget.bookingDetails['servicePrice']}',
                                style: TextStyle(
                                  fontFamily: 'Schyler1',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Payment Options",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'Schyler2',
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 15),
              Card(
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile<String>(
                      title: Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                                "assets/images/gp.png", height: 60, width: 60),
                            onTap: () {
                              _launchGpay();
                            },
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Google Pay',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2',
                            ),
                          ),
                        ],
                      ),
                      value: 'Google Pay',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                                "assets/images/pp.png", height: 50, width: 50),
                            onTap: () {
                              _launchPhonepe();
                            },
                          ),
                          SizedBox(width: 25),
                          Text(
                            'PhonePe',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2',
                            ),
                          ),
                        ],
                      ),
                      value: 'PhonePe',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                                "assets/images/ptp.png", height: 50, width: 50),
                            onTap: () {
                              _launchpaytm();
                            },
                          ),
                          SizedBox(width: 25),
                          Text(
                            'Paytm',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Schyler2',
                            ),
                          ),
                        ],
                      ),
                      value: 'Paytm',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text(
                        'Cash on Delivery',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler2',
                        ),
                      ),
                      value: 'Cash on Delivery',
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[100],
                    ),
                    onPressed: _handlePayment,
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchGpay() async {
    const url = 'https://payments.google.com/gp/w/u/0/home/signup';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhonepe() async {
    const url = 'https://www.phonepe.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchpaytm() async {
    const url = 'https://paytm.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _handlePayment() {
    if (_selectedPaymentOption != null) {
      _savePaymentOptionToFirebase();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Payment Confirmation"),
            content: Text("Payment done using $_selectedPaymentOption."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        UserBottomBar()), // Navigate to UserHome
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a payment option.')),
      );
    }
  }


  void _savePaymentOptionToFirebase() async {
    try {
      await _firestore.collection('payments').add({
        'userName': widget.bookingDetails['userName'], // Include user's name
        'serviceType': widget.bookingDetails['serviceType'],
        'serviceName': widget.bookingDetails['serviceName'],
        'servicePrice': widget.bookingDetails['servicePrice'],
        'paymentMethod': _selectedPaymentOption,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save payment option: $e')),
      );
    }
  }
}
