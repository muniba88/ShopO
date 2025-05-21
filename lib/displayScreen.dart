import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/CartScreen.dart';
import 'package:shopping_app/Idpage.dart';
import 'package:shopping_app/wishlistScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DisplayScreen(),
    );
  }
}

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int _selectedIndex = 0;

  // Assuming the email or user image is stored in a variable
  String userEmailImage = 'images/user_profile_image.jpg'; // Replace with dynamic image URL

  void navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
    );
  }

  void navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Idpage()),
    );
  }

  void toggleWishlist(BuildContext context, Map<String, dynamic> product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    if (cartProvider.wishlist.contains(product)) {
      cartProvider.removeFromWishlist(cartProvider.wishlist.indexOf(product));
    } else {
      cartProvider.addToWishlist(product);
    }
  }

  final List<Map<String, dynamic>> products = [
    {
      "image": "images/shoes.jpg",
      "name": "Shoes",
      "description": "Elegant & long-lasting shoes",
      "price": 49.99,
      "rating": 4.5,
    },
    {
      "image": "images/nakles.jpeg",
      "name": "Designer Necklace",
      "description": "Stylish & premium quality",
      "price": 79.99,
      "rating": 4.8,
    },
    {
      "image": "images/makup.jpeg",
      "name": "Makeup Kit",
      "description": "Complete makeup set",
      "price": 59.99,
      "rating": 4.3,
    },
    {
      "image": "images/heal.jpeg",
      "name": "Heel Shoes",
      "description": "Comfortable & durable",
      "price": 89.99,
      "rating": 4.7,
    },
    {
      "image": "images/earbud.jpg",
      "name": "Wireless Earbuds",
      "description": "Noise canceling & deep bass",
      "price": 69.99,
      "rating": 4.6,
    },
  ];

  final List<Map<String, dynamic>> dresses = [
    {
      "image": "images/dress1.jpg",
      "name": "Elegant Dress",
      "description": "Perfect wear",
      "price": 120.00,
      "rating": 4.9,
    },
    {
      "image": "images/dress2.jpg",
      "name": "Summer Dress",
      "description": "Light fabric",
      "price": 65.00,
      "rating": 4.5,
    },
    {
      "image": "images/dress3.jpg",
      "name": "Black Gown",
      "description": "Graceful design",
      "price": 140.00,
      "rating": 4.8,
    },
    {
      "image": "images/dress4.jpg",
      "name": "Floral Dress",
      "description": "Beautiful design",
      "price": 85.00,
      "rating": 4.6,
    },
    {
      "image": "images/dress5.jpg",
      "name": "Bohemian Style",
      "description": "Trendy look",
      "price": 75.00,
      "rating": 4.7,
    },
    {
      "image": "images/dress6.jpg",
      "name": "Chic Dress",
      "description": "Elegant design",
      "price": 110.00,
      "rating": 4.9,
    },
  ];

  void toggleCart(BuildContext context, Map<String, dynamic> product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    if (cartProvider.cartItems.contains(product)) {
      cartProvider.removeFromCart(
        cartProvider.cartItems.indexOf(product),
      );
    } else {
      cartProvider.addToCart(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
                  Icon(Icons.menu, size: 30),
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
                    onTap: navigateToCheckout,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(userEmailImage), // Dynamic image
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
              Image.asset('images/sale.jpg',
                  width: double.infinity, height: 150, fit: BoxFit.cover),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products
                      .map((product) => _buildProductItem(context, product))
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
              Image.asset('images/offer.jpg',
                  width: double.infinity, height: 150, fit: BoxFit.cover),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dresses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return _buildProductItem(context, dresses[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          final cartProvider = Provider.of<CartProvider>(context,
              listen: false); // Get the CartProvider
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 2) {
              navigateToCart();
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WishlistScreen(wishlist: cartProvider.wishlist),
                ),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: buildBadgeIcon(
              icon: Icons.favorite_border,
              count: cartProvider.wishlist.length,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: buildBadgeIcon(
              icon: Icons.shopping_cart,
              count: cartProvider.cartItems.length,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget buildBadgeIcon({required IconData icon, required int count}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon),
        if (count > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, Map<String, dynamic> product) {
    final cartProvider = Provider.of<CartProvider>(context);
    bool isInCart = cartProvider.cartItems.contains(product);

    return Container(
      width: 160,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(product["image"],
                height: 100, fit: BoxFit.cover, width: double.infinity),
          ),
          SizedBox(height: 5),
          Text(product["name"],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(product["description"],
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 5),
          Text('\$${product["price"]}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  isInCart
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                  color: isInCart ? Colors.red : Colors.pink,
                ),
                onPressed: () => toggleCart(context, product),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  cartProvider.wishlist.contains(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: cartProvider.wishlist.contains(product)
                      ? Colors.red
                      : Colors.pink,
                ),
                onPressed: () => toggleWishlist(context, product),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
