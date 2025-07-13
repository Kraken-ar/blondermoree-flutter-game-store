import 'package:flutter/material.dart';

import '../data.dart';

class CheckoutPage extends StatefulWidget {
   VoidCallback removAll;

   CheckoutPage({required this.removAll});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Name validation logic
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  // Email validation logic
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an Address';
    }
    // Regular expression for basic email validation
   
    return null;
  }

  // Phone number validation logic
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length < 10) {
      return 'Phone number should be at least 10 digits';
    }
    return null;
  }

  // Method to check form validation and navigate
  void _placeOrder(BuildContext context) {
    if (_formKey.currentState!.validate()) {
         widget.removAll();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Order',style: TextStyle(color: Colors.white),),
        actions: [],
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView( // Wrap the content in a scrollable view
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the elements vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                Text(
                  'Checkout Order',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 30),

                // Full Name Field
                _buildTextField('Full Name', _nameController, _validateName),
                SizedBox(height: 16),

                // Email Field
                _buildTextField('Address', _emailController, _validateEmail),
                SizedBox(height: 16),

                // Phone Field
                _buildTextField('Phone', _phoneController, _validatePhone),
                SizedBox(height: 30),

                // Place Order Button
                ElevatedButton(
                  onPressed: () => _placeOrder(context),
                  child: Text(
                    "Place Order",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                    backgroundColor: Colors.blueAccent, // Button color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.black.withOpacity(0.5), // Button shadow
                    elevation: 10, // Shadow depth
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField Builder with validation
  Widget _buildTextField(String label, TextEditingController controller, FormFieldValidator<String>? validator) {
    return Container(
      width: double.infinity, // Allow the TextField to use full width
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70),
          fillColor: Colors.grey[800],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25), // Round the corners
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30, width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        actions: [],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              // Order Completed Message
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 80,
              ),
              SizedBox(height: 20),
              Text(
                'Order Completed!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'On the way. Your order will arrive in 2-3 hours.',
                style: TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Track Order Button
              ElevatedButton(
                onPressed: () {
                  print("Track Order clicked");
                  // Add functionality to track the order if necessary
                },
                child: Text(
                  "Track Order",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                  backgroundColor: Colors.blueAccent, // Button color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black.withOpacity(0.5), // Button shadow
                  elevation: 10, // Shadow depth
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}