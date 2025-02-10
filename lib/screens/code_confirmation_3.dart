import 'package:flutter/material.dart';
import 'Code_confirmation_4.dart';

class CloseDoorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Header Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.greenAccent.shade100,
              padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'modulor ',
                        style: TextStyle(
                          fontSize: screenHeight * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'go',
                        style: TextStyle(
                          fontSize: screenHeight * 0.035,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Close the door',
                    style: TextStyle(
                      fontSize: screenHeight * 0.032,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10),
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
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pick Up Your Items',
                    style: TextStyle(
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Order details >',
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content Section
          Positioned.fill(
            top: screenHeight * 0.3, // Start content below the header
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please close the door',
                    style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Door 1',
                    style: TextStyle(
                      fontSize: screenHeight * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Button at the bottom
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeConfirmation4(),
                    ),
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
                  'I have closed the door',
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
