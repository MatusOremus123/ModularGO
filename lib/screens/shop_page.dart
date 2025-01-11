import 'package:flutter/material.dart';
import 'home_page.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            // Red Header Section
            Container(
              color: Color(0xFFE31C19),
              width: screenWidth,
              height: screenHeight * 0.2,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  // PNG Logo
                  Image.asset(
                    'assets/MODULAR.png',
                    height: screenHeight * 0.05,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      // Handle campus selection here
                    },
                    child: Text(
                      'SRH New Campus >',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: screenHeight * 0.018,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products or machines...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Products and Content Section
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Products Section
                      _buildSectionTitle('Products near you'),
                      SizedBox(height: 12),
                      _buildHorizontalList([
                        {'imagePath': 'assets/Maker.png', 'name': 'Marker', 'price': '2,75 €'},
                        {'imagePath': 'assets/Sketchbook1.png', 'name': 'Sketchbook', 'price': '3,10 €'},
                        {'imagePath': 'assets/Notebook.png', 'name': 'Notebook', 'price': '2,50 €'},
                      ], screenWidth),

                      SizedBox(height: 20),
                      // Vending Machines Section
                      _buildSectionTitle('Vending Machines near you'),
                      SizedBox(height: 10),
                      _buildHorizontalList([
                        {'imagePath': 'assets/shelf.png', 'name': '001', 'price': ''},
                      ], screenWidth),

                      SizedBox(height: 20),
                      // Former Purchases Section
                      _buildSectionTitle('Your former purchase'),
                      SizedBox(height: 18),
                      _buildHorizontalList([
                        {'imagePath': 'assets/Maker.png', 'name': 'Pen', 'price': '1,50 €'},
                        {'imagePath': 'assets/Notebook.png', 'name': 'Notebook', 'price': '2,50 €'},
                        {'imagePath': 'assets/Sketchbook1.png', 'name': 'Sketchbook', 'price': '3,10 €'},
                      ], screenWidth),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // Bottom Navigation Bar
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              _buildTaskBarItem(
                icon: Icons.edit,
                label: "Products",
                onTap: () {
                  // Handle Products navigation
                },
              ),
              _buildTaskBarItem(
                icon: Icons.build,
                label: "Machines",
                onTap: () {
                  // Handle Machines navigation
                },
              ),
              _buildTaskBarItem(
                icon: Icons.shopping_cart,
                label: "Cart",
                onTap: () {
                  // Handle Cart navigation
                },
              ),
              _buildTaskBarItem(
                icon: Icons.person,
                label: "Me",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle "See more" action
          },
          child: Text(
            '> ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalList(List<Map<String, String>> items, double screenWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.39,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                      image: AssetImage(item['imagePath']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item['name']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item['price']!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
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
