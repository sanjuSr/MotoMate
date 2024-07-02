import 'package:bikeserviceapp/USER/RSA/RSA-Payment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';


class RSABooking extends StatefulWidget {
  const RSABooking({super.key});

  @override
  State<RSABooking> createState() => _RSABookingState();
}

class _RSABookingState extends State<RSABooking> {
  final _formKey = GlobalKey<FormState>();
  final _vehicleNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _locationController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _complaintController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentReference bookingRef = await FirebaseFirestore.instance.collection('RSABooking').add({
          'vehicleNumber': _vehicleNumberController.text,
          'phoneNumber': _phoneNumberController.text,
          'location': _locationController.text,
          'landmark': _landmarkController.text,
          'complaint': _complaintController.text,
          'userId': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });


        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RSAPayment(bookingRef: bookingRef),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not logged in!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: Colors.grey),
    );

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Lottie.asset('assets/images/book-bike.json'),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _vehicleNumberController,
                  decoration: InputDecoration(
                    labelText: 'Vehicle Number',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _landmarkController,
                  decoration: InputDecoration(
                    labelText: 'Landmark',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter landmark';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _complaintController,
                  decoration: InputDecoration(
                    labelText: 'Complaint',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter complaint';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[100]
                ),
                onPressed: _submitForm,
                child: Text('Book Now',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _vehicleNumberController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    _landmarkController.dispose();
    _complaintController.dispose();
    super.dispose();
  }
}
