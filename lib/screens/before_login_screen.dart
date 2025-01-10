import 'package:flutter/material.dart';
import 'login_screen.dart';

class BeforeLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Column(
            children: [
              // Top image
              Container(
                width: double.infinity,
                height: screenHeight * 0.49,
                child: Image.asset(
                  'assets/topPicture.png',
                  fit: BoxFit.cover,
                ),
              ),


              Expanded(
                child: Container(
                  color: Color(0xFFE31C19),
                ),
              ),
            ],
          ),

          // Modular Logo at the Top
          Positioned(
            top: MediaQuery.of(context).padding.top + 40,
            left: 20,
            child: Image.asset(
              'assets/ModularRED.png',
              width: 300,
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
                    "Register for free\nStart ordering essential\nstationeries now",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.037),

              // Log in Button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.07,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFE31C19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.023,
                    ),
                    minimumSize: Size(
                      double.infinity,
                      screenHeight * 0.07,
                    ),
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Register Button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.07,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle register logic
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFFE31C19),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.023,
                    ),
                    minimumSize: Size(
                      double.infinity,
                      screenHeight * 0.07,
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

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
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
