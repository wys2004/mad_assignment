import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final double currentAmount;
  final double goalAmount;

  PaymentPage({required this.currentAmount, required this.goalAmount});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _controller = TextEditingController();

  void _submitDonation() {
    final amount = double.tryParse(_controller.text) ?? 0;
    final newTotal = widget.currentAmount + amount;
    Navigator.pop(context, newTotal); // Return to HomeContent with updated amount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Goal: RM${widget.goalAmount.toStringAsFixed(2)}"),
            Text("Current: RM${widget.currentAmount.toStringAsFixed(2)}"),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter donation amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDonation,
              child: Text('Donate Now'),
            )
          ],
        ),
      ),
    );
  }
}
