import 'package:flutter/material.dart';
import 'Pick_up_1.dart'; // Ensure this import path is correct

class OrderSuccessPage extends StatelessWidget {
  final String orderDocumentId;

  const OrderSuccessPage({super.key, required this.orderDocumentId});

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
                  children: List.generate(3, (index) => Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(radius: 7, backgroundColor: Colors.black.withOpacity(0.5)),
                  ))
                    ..add(
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
                        GestureDetector(
                          onTap: () {
                            // Add location details logic
                          },
                          child: Text(
                            'Location Details',
                            style: TextStyle(
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
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

          // Action Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildButton(
                  text: 'Pick up now',
                  bgColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () => _handlePickupNow(context),
                ),
                SizedBox(height: 10),
                _buildButton(
                  text: 'Cancel this order',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  border: BorderSide(color: Colors.black),
                  onPressed: () => _handleCancelOrder(context),
                ),
                SizedBox(height: 10),
                _buildButton(
                  text: 'Close',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  border: BorderSide(color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _handlePickupNow(BuildContext context) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PickUp1(orderDocumentId: orderDocumentId),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to start pickup: ${e.toString()}')),
      );
    }
  }

  void _handleCancelOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Confirm Cancellation'),
        content: Text('Are you sure you want to cancel this order?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              // Add actual cancellation logic here
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    VoidCallback? onPressed,
    BorderSide? border,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: border == null
          ? ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      )
          : OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: border,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}