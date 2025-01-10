import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Dynamic Red Header Section
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
                    // Logo Image aligned to the left
                    Image.asset(
                      'assets/MODULAR.png',
                      height: screenHeight * 0.037,
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
                  "Become a member now",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Do you already have a modulor go profile? Log in here >",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.02,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // White Form Section
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Fields
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Birthday',
                        hintText: 'DD-MM-YYYY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "In the next step you will receive a verification code to this email address.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Make sure the password contains:\n"
                            "• At least 8 characters\n"
                            "• A capital letter\n"
                            "• A lowercase letter\n"
                            "• At least one number or special character\n"
                            "• No more than two repeated characters in a line",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Text.rich(
                              TextSpan(
                                text: "I hereby agree to the ",
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: "conditions of registration.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: isChecked
                          ? () {

                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Column(
                      children: [
                        Text(
                          "modulor go - ",
                          style: TextStyle(fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {

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
