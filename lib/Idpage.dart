import 'package:flutter/material.dart';
import 'package:shopping_app/Controller/auth.dart';
import 'package:shopping_app/loginScreen3.dart';
import 'package:crypto/crypto.dart'; // for Gravatar hashing
import 'dart:convert'; // for utf8.encode

class Idpage extends StatefulWidget {
  @override
  _IdpageState createState() => _IdpageState();
}

class _IdpageState extends State<Idpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

  String? userName;
  String? userEmail;
  String? profileImageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await getUser();
    if (user != null) {
      setState(() {
        userName = user.name;
        userEmail = user.email;
        emailController.text = userEmail ?? '';
        profileImageUrl = _getGravatarUrl(userEmail ?? '');
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  String _getGravatarUrl(String email) {
    final bytes = utf8.encode(email.trim().toLowerCase());
    final digest = md5.convert(bytes);
    return "https://www.gravatar.com/avatar/$digest?s=200&d=identicon";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'CheckOut',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image and Name
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: profileImageUrl != null
                              ? NetworkImage(profileImageUrl!)
                              : AssetImage('images/dp.jpeg') as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  if (userName != null)
                    Center(
                      child: Text(
                        userName!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),

                  SizedBox(height: 30),

                  Text(
                    'Personal Detail',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Email field
                  Text('Email address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextField(
                    controller: emailController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 20),

                  // Password field
                  Text('Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen3()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color.fromARGB(255, 252, 132, 172),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(color: Colors.grey, thickness: 1, height: 40),

                  // Business Address
                  Text('Business Address Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),

                  _buildTextField('PinCode', pinCodeController, TextInputType.number),
                  SizedBox(height: 20),
                  _buildTextField('Address', addressController, TextInputType.text),
                  SizedBox(height: 20),
                  _buildTextField('City', cityController, TextInputType.text),
                  SizedBox(height: 20),
                  _buildTextField('State', stateController, TextInputType.text),
                  SizedBox(height: 20),
                  _buildTextField('Country', countryController, TextInputType.text),

                  Divider(color: Colors.grey, thickness: 1, height: 40),

                  // Business Account
                  Text('Business Account Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),

                  _buildTextField('Bank Account Number', bankAccountController, TextInputType.number),
                  SizedBox(height: 20),
                  _buildTextField('Account Holder Name', accountHolderController, TextInputType.text),
                  SizedBox(height: 20),
                  _buildTextField('IFSC Code', ifscCodeController, TextInputType.text),

                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Handle save action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: OutlineInputBorder(),
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
