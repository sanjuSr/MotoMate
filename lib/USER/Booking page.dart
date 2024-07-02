import 'package:bikeserviceapp/USER/Payment-Page.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingPage extends StatefulWidget {
  final String serviceType;
  final String serviceName;
  final String serviceDescription;
  final String servicePrice;

  const BookingPage({
    Key? key,
    required this.serviceType,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vehiclenameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submitBooking() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a time')),
        );
        return;
      }

      int year = _selectedDate.year;
      int month = _selectedDate.month;
      int day = _selectedDate.day;
      int hour = _selectedTime!.hour;
      int minute = _selectedTime!.minute;


      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        Map<String, dynamic> bookingDetails = {
          'userId': currentUser.uid,
          'serviceType': widget.serviceType,
          'userName': _nameController.text,
          'vehicleName': _vehiclenameController.text,
          'vehicleNumber': _numberController.text,
          'complaint': _complaintController.text,
          'bookingDate': {'year': year, 'month': month, 'day': day},
          'bookingTime': {'hour': hour, 'minute': minute},
          'serviceName': widget.serviceName,
          'serviceDescription': widget.serviceDescription,
          'servicePrice': widget.servicePrice,
        };

        await FirebaseFirestore.instance.collection('bookings').add(bookingDetails);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking submitted successfully!')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(bookingDetails: bookingDetails),
          ),
        );
      } else {
        // No user is logged in
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user logged in')),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book ${widget.serviceType} Service',
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
          child: Form(
            key: _formKey,
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
                          'Service Name: ${widget.serviceName}',
                          style: TextStyle(
                            fontFamily: 'Schyler1',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Service Description : ',
                          style: TextStyle(
                            fontFamily: 'Schyler1',
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '${widget.serviceDescription}',
                            style: TextStyle(
                              fontFamily: 'Schyler1',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Service Price: ₹${widget.servicePrice}',
                          style: TextStyle(
                            fontFamily: 'Schyler1',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _vehiclenameController,
                  decoration: InputDecoration(
                    labelText: 'Vehicle Model',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: 'Vehicle Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _complaintController,
                  decoration: InputDecoration(
                    labelText: 'Complaint',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10),
                Text(
                  'Select Time:',
                  style: TextStyle(
                    fontFamily: 'Schyler2',
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration:BoxDecoration(
                      color: Colors.redAccent[100],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width*0.950,
                  height: MediaQuery.of(context).size.height*0.07,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                        ),
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: Text('Select Time',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        _selectedTime == null
                            ? 'Time not selected'
                            : 'Selected Time: ${_selectedTime!.format(context)}',
                        style: TextStyle(
                          fontFamily: 'Schyler1',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 15,),
                Text(
                  'Select Date:',
                  style: TextStyle(
                    fontFamily: 'Schyler2',
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },
                  activeColor: const Color(0xff85A389),
                  dayProps: const EasyDayProps(
                    todayHighlightStyle: TodayHighlightStyle.withBackground,
                    todayHighlightColor: Color(0xffE1ECC8),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                ),


                SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.950,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent[100]
                      ),
                      onPressed: _submitBooking,
                      child: Text('Submit Booking',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
