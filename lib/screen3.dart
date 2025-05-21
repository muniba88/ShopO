import 'package:flutter/material.dart';
import 'package:shopping_app/loginScreen.dart';
import 'screen2.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// **3/3 Indicator**
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "3",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "/3",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),

            /// **Skip Button**
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
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
      ),

      /// **Body Section**
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// **Image**
          Image.asset('images/order.jpg', width: 350, height: 350),

          SizedBox(height: 10),

          /// **Heading**
          Text(
            "Get Your Order",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 5),

          /// **Paragraph**
          Text(
            "Your order will be delivered to your doorstep safely and on time.",
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),
        ],
      ),

      /// **Bottom Navigation (Prev & Get Started)**
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// **Prev Button**
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Screen2()),
              ),
              child: Text(
                "Prev",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),

            /// **Get Started Button**
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
