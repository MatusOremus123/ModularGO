import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final double bottomImageWidth = 250.0;
  final double bottomImageHeight = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
          flexibleSpace: Stack(
            children: [

              Positioned(
                top: 85,
                left: 6,
                child: Image.asset(
                  'assets/LOGO.png',
                  height: 50,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image failed to load');
                  },
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/Title.png',
                  height: 50,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image failed to load');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [

          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Rectangle.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20), // Spacer


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  'Vending Machines near you',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Image.asset(
                  'assets/Close Button.png',
                  height: 24,
                  width: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image failed to load');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(200),
              ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/shelf.png',
                          width: 130,
                          height: 130,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text('Image failed to load');
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '001',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Text(
                            'Development Lab',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: bottomImageHeight,
        width: bottomImageWidth,
        child: Image.asset(
          'assets/Frame 4.png',

        ),
      ),
    );
  }
}
