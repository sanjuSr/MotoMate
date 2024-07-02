import 'package:bikeserviceapp/USER/UserBottomBar.dart';
import 'package:bikeserviceapp/USER/user-home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RSAPayment extends StatefulWidget {
  final DocumentReference bookingRef;

  const RSAPayment({super.key, required this.bookingRef});

  @override
  State<RSAPayment> createState() => _RSAPaymentState();
}

class _RSAPaymentState extends State<RSAPayment> {
  String? _selectedPaymentOption;


  Future<void> _submitPayment() async {
    try {

      if (_selectedPaymentOption == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a payment method')),
        );
        return;
      }

      await widget.bookingRef.collection('RSApayment').add({
        'paymentMethod': _selectedPaymentOption,
        'timestamp': FieldValue.serverTimestamp(),
      });


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment method saved successfully!')),
      );


      Navigator.push(context, MaterialPageRoute(builder: (context) => UserBottomBar()));
    } catch (e) {

      print('Error saving payment method: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save payment method. Please try again.')),
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          "Payment",
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: \$499',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile<String>(
              title: Row(
                children: [
                  Image.asset("assets/images/gp.png",height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Text('Google Pay'),
                ],
              ),
              value: 'Google Pay',
              groupValue: _selectedPaymentOption,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentOption = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Row(
                children: [
                  Image.asset("assets/images/pp.png",height: 40,width: 40,),
                  SizedBox(width: 10,),
                  Text('PhonePe'),
                ],
              ),
              value: 'PhonePe',
              groupValue: _selectedPaymentOption,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentOption = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Row(
                children: [
                  Image.asset("assets/images/ptp.png",height: 40,width: 40,),
                  SizedBox(width: 10,),
                  Text('Paytm'),
                ],
              ),
              value: 'Paytm',
              groupValue: _selectedPaymentOption,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentOption = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[100]
                ),
                onPressed: _submitPayment,
                child: Text('Pay',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
