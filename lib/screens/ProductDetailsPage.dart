import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shop_page.dart';
import 'vending_machines_page.dart';

class ProductInfoPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final double productPrice;
  final String productDescription;

  const ProductInfoPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  int quantity = 1;
  String selectedColor = "";

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
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
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> colors = [
      'Blau', 'Braun', 'Gelb', 'Grün', 'Orange', 'Rosa', 'Rot', 'Schwarz', 'Violett'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: const Color(0xFFE31C19), // Red color
      ),
      body: Column(
        children: [
          // Product Image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.productImage,
              height: screenHeight * 0.26,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          // Product Details
          Text(
            widget.productName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Product Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.productDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 10),


          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PLEASE SELECT A SPECIFICATION OR COLOR TO CONTINUE",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Color Options
                    Wrap(
                      spacing: 11,
                      runSpacing: 8,
                      children: colors.map((color) {
                        return ChoiceChip(
                          label: Text(color),
                          selected: selectedColor == color,
                          onSelected: (selected) {
                            setState(() {
                              selectedColor = selected ? color : "";
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Price and Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '€${(widget.productPrice * quantity).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        Row(
                          children: [
                            IconButton(
                              onPressed: _decrementQuantity,
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              onPressed: _incrementQuantity,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),


                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {

                            },
                            child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              side: const BorderSide(color: Colors.black, width: 1),
                            ),
                            onPressed: () {
                              // Handle buy now
                            },
                            child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
    );
  }
}
