import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/CartScreen.dart';
import 'package:shopping_app/Idpage.dart';
import 'package:shopping_app/displayScreen.dart';

class WishlistScreen extends StatefulWidget {
  final List<Map<String, dynamic>> wishlist;

  const WishlistScreen({Key? key, required this.wishlist}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) async {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DisplayScreen()),
      );
    } else if (index == 2) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
      setState(() {});
    }
  }

  void _goToDisplayScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DisplayScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlist = cartProvider.wishlist;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _goToDisplayScreen,
                    child: Icon(Icons.chevron_right, size: 30),
                  ),
                  Row(
                    children: [
                      Image.asset('images/logo2-removebg-preview.png',
                          height: 50),
                      SizedBox(width: 5),
                      Text("ShopO",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Idpage()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('images/dp.jpeg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Products",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              wishlist.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: wishlist.length,
                      itemBuilder: (context, index) {
                        final product = wishlist[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 4),
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
                                'Description:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                product['description'] ?? '',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Price:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '\$${product['price']}',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Rating:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '${product['rating']} ⭐',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    cartProvider.addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Added to cart',
                                          style: TextStyle(
                                            color: Colors.white, // text color
                                          ),
                                        ),
                                        backgroundColor:
                                            Colors.pink, // background color
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.add_shopping_cart),
                                  label: Text("Add to Cart"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Your wishlist is empty!",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
