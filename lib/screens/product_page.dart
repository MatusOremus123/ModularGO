import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import 'shop_page.dart';
import 'home_page.dart';
import 'vending_machines_page.dart';
import 'ProductDetailsPage.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<Product>> _productsFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
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


            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: FutureBuilder<List<Product>>(
                  future: _productsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline, size: 50, color: Colors.red),
                            SizedBox(height: 10),
                            Text('Failed to load products'),
                            ElevatedButton(
                              onPressed: () => setState(() {
                                _productsFuture = _apiService.fetchProducts();
                              }),
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    final products = snapshot.data ?? [];
                    if (products.isEmpty) {
                      return Center(child: Text('No products available'));
                    }

                    return GridView.builder(
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
                                builder: (context) => ProductInfoPage(
                                  productId: product.id,
                                  productName: product.name,
                                  productImage: product.imageUrl,
                                  productPrice: product.price,
                                  productDescription: product.description,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: product.imageUrl.isNotEmpty
                                    ? Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.contain,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : Center(
                                      child: CircularProgressIndicator(
                                        value: progress.expectedTotalBytes != null
                                            ? progress.cumulativeBytesLoaded /
                                            progress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error_outline, size: 40),
                                )
                                    : Container(
                                  color: Colors.grey[200],
                                  child: Center(child: Icon(Icons.image_not_supported)),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                '€${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
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