import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/splashscreen.dart'; // Import the SplashScreen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(), // Initialize the CartProvider here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
