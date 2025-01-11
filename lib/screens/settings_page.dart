import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Updated Header Section from HomePage
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
          // Buttons Section
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the HomePage
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    child: Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: screenHeight * 0.018,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: screenHeight * 0.018,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Settings List Section
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 20),
                Text(
                  "Your modulor",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text("Orders"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                Text(
                  "Your account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text("Personal Data"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text("Address"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text("Communication Settings"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.lock_outline),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.delete_outline),
                  title: Text("Delete Profile"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                Text(
                  "App settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text("Data settings"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.nightlight_round_outlined),
                  title: Text("App Theme"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.language_outlined),
                  title: Text("Language & Region"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                Text(
                  "Information and Support",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  title: Text("Terms and Conditions"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Contact modulor"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("About the app"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                SizedBox(height: 30),
                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      padding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTaskBarItem(Icons.home, "Home", () {
              Navigator.pop(context); // Go back to Home
            }),
            _buildTaskBarItem(Icons.edit, "Products", () {}),
            _buildTaskBarItem(Icons.build, "Machines", () {}),
            _buildTaskBarItem(Icons.shopping_cart, "Cart", () {}),
            _buildTaskBarItem(Icons.person, "Me", () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskBarItem(IconData icon, String label, VoidCallback onTap) {
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
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
