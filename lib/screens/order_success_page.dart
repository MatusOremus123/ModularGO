import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'vending_machines_page.dart';
import 'Pick_up_1.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Green Header Section
          Container(
            color: Colors.greenAccent,
            width: screenWidth,
            height: screenHeight * 0.36,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.09),
                Image.asset(
                  'assets/MODULAR.png',
                  height: screenHeight * 0.037,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  'Payment Successful',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.032,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  children: [
                    CircleAvatar(radius: 7, backgroundColor: Colors.black.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 7, backgroundColor: Colors.black.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 7, backgroundColor: Colors.black.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                Text(
                  'Payment Completion\nOrder Details >',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.019,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // White Section with Pickup Information
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your order has been placed. Please pick it up in the next 30 mins. Now you could pick up your items from',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
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

          // Spacer
          Spacer(),

          // Payment Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PickUp1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pick up now',
                      style: TextStyle(
                        fontSize: screenHeight * 0.023,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel this order',
                      style: TextStyle(
                        fontSize: screenHeight * 0.023,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: screenHeight * 0.023,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
