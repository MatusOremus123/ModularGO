import 'package:flutter/material.dart';
import 'home_page.dart';

class CodeConfirmation4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensure text starts from the left
        children: [
          // Header Section
          Container(
            color: Colors.greenAccent.shade100,
            width: screenWidth,
            height: screenHeight * 0.32,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.075),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/MODULAR.png',
                      height: screenHeight * 0.04,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Thank You !',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.032,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.left, // Align text to the left
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Pick Up completion',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Order details >',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.018,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You have picked all your Items.',
                    style: TextStyle(
                      fontSize: screenHeight * 0.029,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'See You Again!',
                    style: TextStyle(
                      fontSize: screenHeight * 0.038,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Button Section with Navigation
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
