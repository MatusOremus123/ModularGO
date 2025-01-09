import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: double.infinity,
                    height: 350,
                    color: Color(0xFFE31C19),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add the PNG logo
                          Image.asset(
                            'assets/MODULAR.png',
                            width: 200,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Log in with your email address",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Don’t have an email address in your profile yet? You can add them here.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),


                        Text(
                          "Please enter your email address to receive a one-time code.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 17),

                        // Email Input Field with Rounded Edges
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email address",
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                          ),
                          style: TextStyle(fontSize: 20)
                        ),
                        SizedBox(height: 25),

                        // Next Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle next logic
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            minimumSize: Size(double.infinity, 70),
                          ),
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        // Alternative Options
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {

                                },
                                child: Text(
                                  "Log in with your password",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "or",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 20),


                              ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  minimumSize: Size(double.infinity, 70),
                                ),
                                child: Center(
                                  child: Text(
                                    "Register now",
                                    style: TextStyle(
                                      fontSize: 20, // Larger text size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Task Bar
          Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTaskBarItem(
                  icon: Icons.home,
                  label: "Home",
                  onTap: () {
                    // Navigate to Home Screen
                  },
                ),
                _buildTaskBarItem(
                  icon: Icons.edit,
                  label: "Products",
                  onTap: () {
                    // Navigate to Products Screen
                  },
                ),
                _buildTaskBarItem(
                  icon: Icons.build,
                  label: "Machines",
                  onTap: () {
                    // Navigate to Machines Screen
                  },
                ),
                _buildTaskBarItem(
                  icon: Icons.shopping_cart,
                  label: "Cart",
                  onTap: () {
                    // Navigate to Cart Screen
                  },
                ),
                _buildTaskBarItem(
                  icon: Icons.person,
                  label: "Me",
                  onTap: () {
                    // Navigate to Profile Screen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each task bar item
  Widget _buildTaskBarItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
