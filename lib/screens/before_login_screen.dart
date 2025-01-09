import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginScreen

class BeforeLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Column(
            children: [
              // Top image
              Container(
                width: double.infinity,
                height: 480, // Adjust height for better display
                child: Image.asset(
                  'assets/topPicture.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),

              // Remaining space with custom red color
              Expanded(
                child: Container(
                  color: Color(0xFFE31C19), // Updated background color
                ),
              ),
            ],
          ),

          // Modular Logo at the Top
          Positioned(
            top: 100, // Adjust as needed
            left: 20, // Align slightly from the left
            child: Image.asset(
              'assets/ModularRED.png', // Replace with your logo asset path
              width: 290, // Adjust width as needed
              fit: BoxFit.contain,
            ),
          ),

          // Centered Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register for free\nStart order essential\nstationeries now",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Log in Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Text color
                    backgroundColor: Color(0xFFE31C19), // Updated background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Less rounded edges
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    padding: EdgeInsets.symmetric(vertical: 23), // Taller button
                    minimumSize: Size(double.infinity, 60), // Full-width button
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Register Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle register logic
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFFE31C19), // Updated text color
                    backgroundColor: Colors.white, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Less rounded edges
                    ),
                    padding: EdgeInsets.symmetric(vertical: 23), // Taller button
                    minimumSize: Size(double.infinity, 60), // Full-width button
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Bottom Task Bar
              Container(
                height: 80,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTaskBarItem(icon: Icons.home, label: "Home"),
                    _buildTaskBarItem(icon: Icons.edit, label: "Products"),
                    _buildTaskBarItem(icon: Icons.build, label: "Machines"),
                    _buildTaskBarItem(icon: Icons.shopping_cart, label: "Cart"),
                    _buildTaskBarItem(icon: Icons.person, label: "Me"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build each task bar item
  Widget _buildTaskBarItem({required IconData icon, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
