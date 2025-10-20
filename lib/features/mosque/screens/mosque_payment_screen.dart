import 'package:flutter/material.dart';

class MosquePaymentScreen extends StatelessWidget {
  const MosquePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মসজিদের হিসাব'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // This will be replaced with actual data from Firestore
          ListTile(
            title: Text('মাসিক চাঁদা - জানুয়ারি'),
            subtitle: Text('পরিমাণ: ৫০০ টাকা'),
            trailing: Chip(
              label: Text('পরিশোধিত'),
              backgroundColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text('মাসিক চাঁদা - ফেব্রুয়ারি'),
            subtitle: Text('পরিমাণ: ৫০০ টাকা'),
            trailing: Chip(
              label: Text('বাকি'),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
