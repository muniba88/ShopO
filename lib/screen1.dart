import 'package:flutter/material.dart';
import 'package:shopping_app/loginScreen.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Top Row - Page Indicator & Skip**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "1",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: "/3",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }, 
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50), // Space before image

            /// **Centered Image**
            Center(
              child: Image.asset(
                'images/choose_product-removebg-preview.png',
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 20), // Space before text

            /// **Heading**
            Center(
              child: Text(
                "Choose Product",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),

            /// **Instruction Paragraph**
            Center(
              child: Text(
                "Browse through a variety of products and select the best one for your needs. "
                "Ensure that you review the details before making a decision.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),

            Expanded(child: Container()), // Pushes Next button to the bottom

            /// **Bottom Right - Next Button**
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
