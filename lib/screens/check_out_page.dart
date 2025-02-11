import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this import
import '../providers/cart_provider.dart'; // Add this import
import 'checkout_page_2.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        return false; // Prevents back navigation
      },
      child: Scaffold(
        body: Column(
          children: [
            // Red Header Section
            Container(
              color: Color(0xFFE31C19), // Red color
              width: screenWidth,
              height: screenHeight * 0.39,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
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
                      fontSize: screenHeight * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      // Progress indicator
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...List.generate(3, (index) {
                        return Row(
                          children: [
                            SizedBox(width: 10),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white.withOpacity(0.5),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Machine Confirmation',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.02,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // White Section
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You will pick up your items from',
                          style: TextStyle(
                            fontSize: screenHeight * 0.018,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '001',
                              style: TextStyle(
                                fontSize: screenHeight * 0.04,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Development Lab',
                              style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                // Handle location details
                              },
                              child: Text(
                                'Location Details',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.018,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                // Handle switch machines
                              },
                              child: Text(
                                'Switch machines >',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.018,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/shelf.png',
                          height: screenHeight * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.15),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Pass cart items to CheckOutPage2
                            final cartProvider = Provider.of<CartProvider>(context, listen: false);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutPage2(cartItems: cartProvider.items),
                              ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}