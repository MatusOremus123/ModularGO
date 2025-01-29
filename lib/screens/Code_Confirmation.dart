import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'vending_machines_page.dart';
import 'order_success_page.dart';
import 'Code_Confirmation_2.dart';

class CodeConfirmation extends StatelessWidget {
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
            height: screenHeight * 0.32,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.085),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/MODULAR.png',
                      height: screenHeight * 0.038,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Pick up Your Order',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.035,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [

                    CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    // Second active dot with number
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Remaining inactive dots
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
                  'Code Confirmation',
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


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'please press these code to the Machine',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1234',
                          style: TextStyle(
                            fontSize: screenHeight * 0.07,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CodeConfirmation2()),
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
                      'I Pressed The code ',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
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
                      'Cancel this Order',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
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
                      'Back',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
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