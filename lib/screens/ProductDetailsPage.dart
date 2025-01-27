import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final double productPrice;
  final String productDescription;  // Added description

  const ProductInfoPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,  // Added description
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<String> colors = [
      'Blau',
      'Braun',
      'Gelb',
      'Grün',
      'Orange',
      'Rosa',
      'Rot',
      'Schwarz',
      'Violett',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: const Color(0xFFFFC107), // Yellow color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Product Image
            Image.asset(
              widget.productImage,
              height: screenHeight * 0.3,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // Product Details
            Text(
              widget.productName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Product Description
            Text(
              widget.productDescription,  // Display the description here
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Color Options
            Wrap(
              spacing: 10,
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

            // Price and Quantity - Aligned in the same Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Price with Expanded to make sure the quantity controls stay to the right
                Expanded(
                  child: Text(
                    '€${(widget.productPrice * quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Quantity Controls
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

            // Add to Cart and Buy Now Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Handle add to cart
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Handle buy now
                    },
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
