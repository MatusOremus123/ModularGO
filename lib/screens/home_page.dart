import 'package:flutter/material.dart';
import 'settings_page.dart'; // Import the SettingsPage
import 'shop_page.dart'; // Import the ShopPage

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
                    final logoWidth = constraints.maxWidth * 0.55;
                    final logoHeight = logoWidth * 0.235;

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
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  'Shervin',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.045,
                    fontWeight: FontWeight.w300,
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
                            padding: EdgeInsets.symmetric(vertical: 19),
                          ),
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
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
                            padding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          child: Text(
                            'Settings',
                            style: TextStyle(color: Colors.black, fontSize: 17),
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
                      fontWeight: FontWeight.w500,
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
                // Navigate to ShopPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
            ),
            _buildTaskBarItem(
              icon: Icons.edit,
              label: "Products",
              onTap: () {
                // Handle navigation to Products Screen
              },
            ),
            _buildTaskBarItem(
              icon: Icons.build,
              label: "Machines",
              onTap: () {
                // Handle navigation to Machines Screen
              },
            ),
            _buildTaskBarItem(
              icon: Icons.shopping_cart,
              label: "Cart",
              onTap: () {
                // Handle navigation to Cart Screen
              },
            ),
            _buildTaskBarItem(
              icon: Icons.settings,
              label: "Settings",
              onTap: () {
                // Navigate to SettingsPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
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
      width: screenWidth * 0.44,
      height: 175,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36),
          SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(fontSize: 18),
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
