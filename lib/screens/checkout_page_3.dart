import 'package:flutter/material.dart';
import 'order_success_page.dart';
import 'checkout_page_2.dart';

class CheckOutPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Red Section - Keep this unchanged
          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.39,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'modulor go',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.03,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Confirm your order details',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.038,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Payment Confirmation',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.025,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // White Section - Pickup Location and Payment
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "You will pick up from",
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "001",
                            style: TextStyle(
                              fontSize: screenHeight * 0.032,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Development Lab",
                            style: TextStyle(
                              fontSize: screenHeight * 0.022,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle Location Details Click
                            },
                            child: Text(
                              "Location Details",
                              style: TextStyle(
                                fontSize: screenHeight * 0.018,
                                fontFamily: 'Roboto',
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/shelf.png', // Make sure the image exists in assets
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  _buildPaymentButton(
                    "Buy with Apple Pay",
                    Colors.black,
                    Colors.white,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderSuccessPage()),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  _buildPaymentButton(
                    "Buy with other payments",
                    Colors.white,
                    Colors.black,
                        () {
                      // Handle other payment logic
                    },
                    isOutlined: true,
                  ),
                  SizedBox(height: screenHeight * 0.0152),
                  _buildPaymentButton(
                    "Back",
                    Colors.white,
                    Colors.black,
                        () {
                      Navigator.pop(context);
                    },
                    isOutlined: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for payment buttons
  Widget _buildPaymentButton(String text, Color bgColor, Color textColor, VoidCallback onPressed, {bool isOutlined = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: isOutlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: textColor,
          ),
        ),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: textColor,
          ),
        ),
      ),
    );
  }
}
