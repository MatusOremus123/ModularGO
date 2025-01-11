import 'package:flutter/material.dart';
import 'settings_page.dart'; // Import the SettingsPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Red Header Section
          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.286,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.099),
                // Responsive logo
                LayoutBuilder(
                  builder: (context, constraints) {
                    final logoWidth = constraints.maxWidth * 0.55; // Adjust logo width relative to screen width
                    final logoHeight = logoWidth * 0.235; // Maintain aspect ratio (adjust as needed)

                    return Image.asset(
                      'assets/MODULAR.png',
                      width: logoWidth,
                      height: logoHeight,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                SizedBox(height: 13),
                Text(
                  'Good evening',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.022,
                    color: Colors.white,
                    fontWeight: FontWeight.w200, // Reduced boldness
                  ),
                ),
                Text(
                  'Shervin',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.045,
                    fontWeight: FontWeight.w300, // Reduced boldness
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // White Content Section
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Buttons Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Overview button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 19), // Increased height
                          ),
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 17, // Optional: Adjust font size
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Navigate to SettingsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 18), // Increased height
                          ),
                          child: Text(
                            'Settings',
                            style: TextStyle(color: Colors.black, fontSize: 17), // Optional: Adjust font size
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Your modulor',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w500, // Reduced boldness
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard(
                        icon: Icons.favorite_outline,
                        label: 'Favorites',
                        screenWidth: screenWidth,
                      ),
                      _buildCard(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Orders',
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Task Bar
      bottomNavigationBar: Container(
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
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required double screenWidth,
  }) {
    return Container(
      width: screenWidth * 0.44, // Increased width
      height: 175, // Increased height for taller boxes
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36), // Slightly larger icon
          SizedBox(height: 12), // Adjusted spacing
          Text(
            label,
            style: TextStyle(fontSize: 18), // Larger font size
          ),
        ],
      ),
    );
  }

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
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
