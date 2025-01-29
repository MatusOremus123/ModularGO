import 'package:flutter/material.dart';
import 'check_out_page.dart';
import 'checkout_page_3.dart';

class CheckOutPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Red Header Section
          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.39,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.055),

                // Logo moved lower
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.01), // Adjust height as needed
                  child: Image.asset(
                    'assets/MODULAR.png',
                    width: screenWidth * 0.49,
                  ),
                ),

                SizedBox(height: screenHeight * 0.086),
                Text(
                  'Confirm your order details',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.04,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: screenHeight * 0.022),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.white.withOpacity(0.2),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...List.generate(2, (index) {
                      return Row(
                        children: [
                          SizedBox(width: 12),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.white.withOpacity(0.5),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          // Spacer
          SizedBox(height: 38),

          // Middle Section (Image + Product Info)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/SketchPen.png',
                        width: 60,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),

                    // Product Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sketch Pen',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Sakura’s Micron Pigma pen',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '3,30 €',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Spacer
          Spacer(),

          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOutPage3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                        vertical: 21, horizontal: screenWidth * 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(
                        vertical: 21, horizontal: screenWidth * 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}