import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/Idpage.dart';
import 'package:shopping_app/displayScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _removeFromCart(int index) {
    Provider.of<CartProvider>(context, listen: false).removeFromCart(index);
  }

  void _goToIdPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Idpage()),
    );
  }

  void _goToDisplayScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DisplayScreen()),
    );
  }

  double _calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(0.0, (sum, item) {
      var price = item['price'];
      if (price is String) price = double.tryParse(price) ?? 0.0;
      return sum + (price ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final totalPrice = _calculateTotalPrice(cartItems);
    const double tax = 10.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _goToDisplayScreen,
                    child: Icon(Icons.chevron_right, size: 30),
                  ),
                  Row(
                    children: [
                      Image.asset('images/logo2-removebg-preview.png', height: 50),
                      SizedBox(width: 5),
                      Text("ShopO", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  GestureDetector(
                    onTap: _goToIdPage,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('images/dp.jpeg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Cart Items List
              Expanded(
                child: cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final product = cartItems[index];

                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product['image'],
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Price:',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  '\$${(product['price'] is String ? double.tryParse(product['price']) : product['price'])?.toStringAsFixed(2) ?? '0.00'}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Rating:',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  '${product['rating']} ⭐',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.remove_shopping_cart, color: Colors.red),
                                    onPressed: () => _removeFromCart(index),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Your Cart is empty!", style: TextStyle(fontSize: 18)),
                        ),
                      ),
              ),

              // Bottom Total + Order Section
              if (cartItems.isNotEmpty)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("\$${totalPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("\$${tax.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Order Placed Successfully",
                            style: TextStyle(
                                            color: Colors.white, // text color
                                          ),
                                        ),
                                        backgroundColor:
                                            Colors.pink, // background color
                                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text("Place Order", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
