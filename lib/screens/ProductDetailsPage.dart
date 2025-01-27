import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  ProductDetailsPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedColor;
  int quantity = 1;

  final List<String> colors = [
    'blau',
    'braun',
    'gelb',
    'grün',
    'orange',
    'rosa',
    'rot',
    'schwarz',
    'violett',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            color: Color(0xFFFFC107),
            width: screenWidth,
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
                          onTap: () {},
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
              ],
            ),
          ),

          // Product Image and Details Section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Center(
                      child: Image.asset(
                        widget.productImage,
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Product Name and Description
                    Text(
                      widget.productName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sakura's Micron Pigma pen",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 16),

                    // Features
                    Text(
                      "\u2022 Archival ink, permanent, lightfast\n" +
                          "\u2022 For legal documents, logbooks, checks, ...\n" +
                          "\u2022 Pigment-based, does not bleed\n" +
                          "\u2022 Not erasable, not correctable\n" +
                          "\u2022 Many line widths and colors",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 16),

                    // Color Selection
                    Text(
                      "Please select a color to continue",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: colors.map((color) {
                        return ChoiceChip(
                          label: Text(color),
                          selected: selectedColor == color,
                          onSelected: (isSelected) {
                            setState(() {
                              selectedColor = isSelected ? color : null;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Price and Quantity
                    if (selectedColor != null) ...[
                      Text(
                        widget.productPrice,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Bottom Buttons
          if (selectedColor != null)
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add to Cart Logic
                    },
                    child: Text("Add to Cart"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Buy Now Logic
                    },
                    child: Text("Buy Now"),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}