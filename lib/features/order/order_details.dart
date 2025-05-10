import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderNumber = "#123456";
  final String status = "Completed";
  final String date = "Jul, 31 2024";
  final String address = "Maadi, Cairo, Egypt.";
  final List<Map<String, String>> items = [
    {"title": "Book A", "qty": "1", "price": "\$20"},
    {"title": "Book B", "qty": "2", "price": "\$35"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 20),
            Text("Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...items.map((item) => ListTile(
                  title: Text(item['title']!),
                  subtitle: Text("Qty: ${item['qty']}"),
                  trailing: Text(item['price']!),
                )),
            const Divider(height: 32),
            buildSummary(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order No: $orderNumber",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Status: $status", style: TextStyle(color: Colors.green)),
            Text("Date: $date"),
            Text("Address: $address"),
          ],
        ),
      ),
    );
  }

  Widget buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPriceRow("Subtotal", "\$90"),
        buildPriceRow("Shipping", "\$10"),
        const Divider(),
        buildPriceRow("Total", "\$100", isBold: true),
      ],
    );
  }

  Widget buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null),
          Text(value,
              style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}
