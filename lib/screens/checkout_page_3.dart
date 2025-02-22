import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';
import '../services/order_service.dart';
import '../models/order_model.dart';
import 'order_success_page.dart';

class CheckOutPage3 extends StatefulWidget {
  @override
  _CheckOutPage3State createState() => _CheckOutPage3State();
}

class _CheckOutPage3State extends State<CheckOutPage3> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final cartProvider = Provider.of<CartProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final orderService = Provider.of<OrderService>(context);

    return Scaffold(
      body: Column(
        children: [

          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.39,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'modulor go',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.03,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Confirm your order details',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.038,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 6, backgroundColor: Colors.white.withOpacity(0.5)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Payment Confirmation',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.025,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "You will pick up from",
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "001",
                            style: TextStyle(
                              fontSize: screenHeight * 0.032,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Development Lab",
                            style: TextStyle(
                              fontSize: screenHeight * 0.022,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              "Location Details",
                              style: TextStyle(
                                fontSize: screenHeight * 0.018,
                                fontFamily: 'Roboto',
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/shelf.png',
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  _buildPaymentButton(
                    "Buy with Apple Pay",
                    Colors.black,
                    Colors.white,
                        () async {
                      if (_isLoading) return;

                      setState(() {
                        _isLoading = true;
                      });

                      try {

                        final items = cartProvider.items.map((item) {
                          return {
                            'product': item.id.toString(),
                            'quantity': item.quantity,
                            'price': {
                              'netPrice': item.price,
                              'currency': 'EUR',
                              'vatRate': 0.19,
                            },
                          };
                        }).toList();

                        // Create an Order object
                        final order = Order(
                          orderStatus: 'UNPAID',
                          issue: false,
                          items: items,
                        );


                        final jwt = authProvider.token;

                        if (jwt == null) {
                          throw Exception('User is not logged in');
                        }


                        await orderService.placeOrder(order: order, jwt: jwt);


                        cartProvider.clearCart();


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderSuccessPage()),
                        );
                      } catch (e) {
                        // Handle errors
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to place order: $e')),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    isLoading: _isLoading,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  _buildPaymentButton(
                    "Buy with other payments",
                    Colors.white,
                    Colors.black,
                        () {

                    },
                    isOutlined: true,
                  ),
                  SizedBox(height: screenHeight * 0.0152),
                  _buildPaymentButton(
                    "Back",
                    Colors.white,
                    Colors.black,
                        () {
                      Navigator.pop(context);
                    },
                    isOutlined: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPaymentButton(String text, Color bgColor, Color textColor, VoidCallback onPressed, {bool isOutlined = false, bool isLoading = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: isOutlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: textColor)
            : Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: textColor,
          ),
        ),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: textColor)
            : Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: textColor,
          ),
        ),
      ),
    );
  }
}