import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'register_screen.dart';
import 'one_time_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.32,
                    color: Color(0xFFE31C19),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/MODULAR.png',
                            width: 209,
                            height: screenHeight * 0.07,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "Log in with your email address",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Don’t have an email address in your profile yet? You can add them here.",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Please enter your email address and password to log in.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 17),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email address",
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 17),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              await authProvider.login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login successful!'),
                                ),
                              );
                              // Navigate to OneTimeCodeScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OneTimeCodeScreen(),
                                ),
                              );
                            } catch (e) {

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login failed: $e'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            minimumSize: Size(double.infinity, 70),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Navigate to OneTimeCodeScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OneTimeCodeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Log in with a one-time code",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "or",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to RegisterScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  minimumSize: Size(double.infinity, 70),
                                ),
                                child: Center(
                                  child: Text(
                                    "Register now",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTaskBarItem(
                  icon: Icons.home,
                  label: "Home",
                  onTap: () {

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

                  },
                ),
              ],
            ),
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