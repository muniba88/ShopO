import 'package:flutter/material.dart';
import 'package:shopping_app/loginScreen.dart';
import 'screen1.dart';
import 'screen3.dart';

class Screen2 extends StatelessWidget {
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
                        text: "2",
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
                'images/payment-removebg-preview.png', // Change this to your payment image
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 20), // Space before text

            /// **Heading**
            Center(
              child: Text(
                "Make Payment",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),

            /// **Instruction Paragraph**
            Center(
              child: Text(
                "Choose a payment method and complete your transaction securely. "
                "Ensure that all payment details are correct before proceeding.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),

            Expanded(child: Container()), // Pushes buttons to the bottom

            /// **Bottom Navigation - Prev & Next**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// **Prev Button - Goes Back to Screen1**
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Goes back to Screen1
                  },
                  child: Text(
                    "Prev",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),

                /// **Next Button - Goes to Screen3**
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
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
