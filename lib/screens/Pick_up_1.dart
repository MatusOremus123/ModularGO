import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'vending_machines_page.dart';
import 'order_success_page.dart';
import 'Code_Confirmation.dart';

class PickUp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Green Header Section with PNG image
          Container(
            color: Colors.greenAccent,
            width: screenWidth,
            height: screenHeight * 0.32,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.09),
                // Image row with left alignment
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/MODULAR.png',
                      height: screenHeight * 0.039,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Pick up Your Order',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.032,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Text(
                        '1',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white.withOpacity(0.5)),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Payment Confirmation',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Content Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are You in Front of this Machine? Kindly Check the Machine code on the machine if it is correct please process now',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '001',
                          style: TextStyle(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Development Lab',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Location Details',
                          style: TextStyle(
                            fontSize: screenHeight * 0.018,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/shelf.png',
                      width: screenWidth * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Updated Elevated Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CodeConfirmation()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 19), // Increased padding
                    minimumSize: Size(double.infinity, 50), // Added minimum size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    'It is the Right Machine',
                    style: TextStyle(
                      fontSize: screenHeight * 0.022, // Increased text size
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15), // Increased spacing
                // Updated Outlined Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(vertical: 19  ), // Increased padding
                    minimumSize: Size(double.infinity, 50), // Added minimum size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    'Cancel this Order',
                    style: TextStyle(
                      fontSize: screenHeight * 0.022, // Increased text size
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25), // Increased bottom spacing
        ],
      ),
    );
  }
}