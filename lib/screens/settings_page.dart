import 'package:flutter/material.dart';
import 'before_login_screen.dart'; // Replace with your actual import
import 'shop_page.dart'; // Import the ShopPage

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.286,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.099),
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
          // Overview and Settings Buttons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BeforeLoginScreen()),
                      );
                    },
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
              );
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
