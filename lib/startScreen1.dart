import 'package:flutter/material.dart';
import 'package:shopping_app/displayScreen.dart';

class startScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// **Background Image**
          Image.asset(
            "images/background.jpg", // Replace with your image path
            fit: BoxFit.cover,
          ),

          /// **Content Centered**
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// **Heading**
              Text(
                "You want Aesthetic,\nHere we go",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// **Subheading**
              Text(
                "Isn't it here? Buy it now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              /// **Get Started Button**
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DisplayScreen()),
  );
},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
