import 'package:flutter/material.dart';

class BeforeLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Before Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Before Login Screen", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                // You can navigate to the home screen or other pages here
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
