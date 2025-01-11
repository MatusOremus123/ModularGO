import 'package:flutter/material.dart';
import 'home_page.dart'; // Import your HomePage class

class OneTimeCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.32, // 30% of screen height for red section
                    color: Color(0xFFE31C19), // Red background
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04, // Adjust padding dynamically
                        vertical: screenHeight * 0.02,
                      ),
                      child: Stack(
                        children: [
                          // Position the logo independently using Padding
                          Positioned(
                            top: screenHeight * 0.044, // Adjust this value to move it lower
                            left: 0,
                            child: Image.asset(
                              'assets/MODULAR.png', // Path to your PNG file
                              height: screenHeight * 0.04, // Adjust size dynamically
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(), // Push the close button to the right
                                  IconButton(
                                    icon: Icon(Icons.close, color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context); // Close the screen
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.05), // Add spacing for text content
                              Text(
                                "Enter your one-time code now",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.037, // Adjust font size dynamically
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300, // Less bold
                                  fontFamily: 'Roboto', // Set font family
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "We have just sent a one-time login code to\nsekermac@gmail.com. Please check your inbox.",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.0136, // Adjust font size dynamically
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300, // Regular weight
                                  fontFamily: 'Roboto', // Set font family
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft, // Align text to the left
                          child: GestureDetector(
                            onTap: () {
                              // Handle resend code logic
                            },
                            child: Text(
                              "Didn’t you receive a code?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontWeight: FontWeight.w400, // Regular weight
                                fontFamily: 'Roboto', // Set font family
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Login code",
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto', // Set font family
                              fontWeight: FontWeight.w400, // Regular weight
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 19, vertical: 17),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Resend code logic
                            },
                            child: Text(
                              "Send a new code",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400, // Regular weight
                                fontFamily: 'Roboto', // Set font family
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to HomePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 64),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21), // Square corners
                            ),
                          ),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500, // Medium weight
                              fontFamily: 'Roboto', // Set font family
                            ),
                          ),
                        ),
                        SizedBox(height: 29),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Go back
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 64),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21), // Square corners
                            ),
                          ),
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500, // Medium weight
                              fontFamily: 'Roboto', // Set font family
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "modulor go - Cookie Policy and Privacy Policy",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400, // Regular weight
                            fontFamily: 'Roboto', // Set font family
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "© 2024 Modulor",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400, // Regular weight
                            fontFamily: 'Roboto', // Set font family
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTaskBarItem(Icons.home, "Home"),
                _buildTaskBarItem(Icons.edit, "Products"),
                _buildTaskBarItem(Icons.build, "Machines"),
                _buildTaskBarItem(Icons.shopping_cart, "Cart"),
                _buildTaskBarItem(Icons.person, "Me"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskBarItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w400, // Regular weight
            fontFamily: 'Roboto', // Set font family
          ),
        ),
      ],
    );
  }
}
