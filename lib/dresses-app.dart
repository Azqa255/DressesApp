import 'package:flutter/material.dart';

class DressPricingApp extends StatefulWidget {
  const DressPricingApp({super.key});

  @override
  State<DressPricingApp> createState() => _DressPricingAppState();
}

class _DressPricingAppState extends State<DressPricingApp> {
  TextEditingController dressQuantityController = TextEditingController();

  double totalPrice = 0.0;
  double finalPriceWithTax = 0.0;
  double taxRate = 0.17;
  double pricePerDressLessThan10 = 2000.0;
  double pricePerDress10OrMore = 1500.0;

  void calculatePrice() {
    if (dressQuantityController.text.isEmpty) dressQuantityController.text = "0";

    int quantity = int.parse(dressQuantityController.text);

    if (quantity < 10) {
      totalPrice = quantity * pricePerDressLessThan10;
    } else {
      totalPrice = quantity * pricePerDress10OrMore;
    }

    finalPriceWithTax = totalPrice + (totalPrice * taxRate);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dress Pricing App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: calculatePrice,
        child: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildStyledText(
              'Pricing Details',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            const Divider(color: Colors.purple, thickness: 2),
            const Text(
              '1. Less than 10 dresses → Rs. 2000 per dress\n'
                  '2. 10 or more dresses → Rs. 1500 per dress\n'
                  '3. 17% tax will be applied to the total price.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildStyledText(
              'Enter Quantity of Dresses:',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            _buildTextField(dressQuantityController, 'Enter dress quantity'),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            _buildStyledText(
              'Results:',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            const Divider(color: Colors.purple, thickness: 2),
            _buildStyledText(
              'Total Price (before tax): Rs. ${totalPrice.toStringAsFixed(2)}',
              fontSize: 18,
            ),
            _buildStyledText(
              'Final Price (with 17% tax): Rs. ${finalPriceWithTax.toStringAsFixed(2)}',
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildStyledText(String text,
      {double fontSize = 16, FontWeight fontWeight = FontWeight.normal, Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
