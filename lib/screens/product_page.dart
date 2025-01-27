import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'home_page.dart';
import 'vending_machines_page.dart';
import 'ProductDetailsPage.dart'; // Import the new details page

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> products = [
      {'image': 'assets/Sketchbook.png', 'name': 'Sketchbook', 'price': '€3.10'},
      {'image': 'assets/Maker.png', 'name': 'Marker', 'price': '€2.75'},
      {'image': 'assets/Notebook.png', 'name': 'Notebook', 'price': '€9.50'},
      {'image': 'assets/SketchPen.png', 'name': 'Sketch Pen', 'price': '€3.30'},
      {'image': 'assets/PaperRolls.png', 'name': 'Paper Rolls', 'price': '€7.90'},
      {'image': 'assets/ColorPaper.png', 'name': 'Color Paper', 'price': '€2.50'},
      {'image': 'assets/BallpointPen.png', 'name': 'Ballpoint Pen', 'price': '€1.20'},
      {'image': 'assets/Ruler.png', 'name': 'Ruler', 'price': '€0.90'},
      {'image': 'assets/Cutter.png', 'name': 'Cutter', 'price': '€4.50'},
      {'image': 'assets/Tape.png', 'name': 'Tape', 'price': '€1.00'},
      {'image': 'assets/CuttingMat.png', 'name': 'Cutting Mat', 'price': '€12.00'},
      {'image': 'assets/MechanicalPencil.png', 'name': 'Mechanical Pencil', 'price': '€3.80'},
    ];

    return WillPopScope(
      onWillPop: () async {
        return false; // Prevents back navigation
      },
      child: Scaffold(
        body: Column(
          children: [
            // Yellow Header Section
            Container(
              color: Color(0xFFFFC107),
              width: screenWidth,
              height: screenHeight * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.065),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/MODULAR.png',
                            height: screenHeight * 0.027,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              // Handle campus selection here
                            },
                            child: Text(
                              'SRH New Campus >',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: screenHeight * 0.018,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.search, size: screenHeight * 0.05),
                    ],
                  ),
                  SizedBox(height: 15),
                  // Machine Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '001',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: screenHeight * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Development Lab',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: screenHeight * 0.027,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 1),
                          GestureDetector(
                            onTap: () {
                              // Handle switch machines action here
                            },
                            child: Text(
                              'Switch machines >',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: screenHeight * 0.018,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/MachinePicture.png',
                        width: screenWidth * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content Section with Product Grid
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              productName: product['name'] ?? 'Unknown',
                              productImage: product['image'] ?? '',
                              productPrice: product['price'] ?? '€0.00',
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            product['image'] ?? '',
                            height: screenHeight * 0.1,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 8),
                          Text(
                            product['name'] ?? 'Unknown',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            product['price'] ?? '€0.00',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopPage()),
                  );
                },
              ),
              _buildTaskBarItem(
                icon: Icons.edit,
                label: "Products",
                onTap: () {
                  // Already on Products page
                },
              ),
              _buildTaskBarItem(
                icon: Icons.build,
                label: "Machines",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VendingMachinesPage()),
                  );
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
                  Navigator.push(
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