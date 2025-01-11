import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController emailController = TextEditingController();
  final List<TextEditingController> codeControllers =
  List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Red Header Section
          Container(
            color: Color(0xFFE31C19),
            width: screenWidth,
            height: screenHeight * 0.3,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    // Logo
                    Text(
                      "modulor go",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Enter the verification code",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "You have received a 6-digit code to your email address",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.02,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // White Content Section
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Email Input
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Code Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: screenWidth * 0.12,
                          child: TextField(
                            controller: codeControllers[index],
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    // Resend Code
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement resend code functionality
                        },
                        child: Text(
                          "Send a new code",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Create Profile Button
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement verification logic
                        Navigator.pushReplacementNamed(context, '/nextScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: Text(
                        "Create Profile",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Footer
                    Column(
                      children: [
                        Text(
                          "modulor go - ",
                          style: TextStyle(fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to privacy policy
                          },
                          child: Text(
                            "Cookie Policy and Privacy Policy",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "© 2024 Modulor",
                          style: TextStyle(fontSize: 12),
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
    );
  }
}
