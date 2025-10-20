import 'package:flutter/material.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('মানবিক সংগঠন'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'কার্যক্রম'),
              Tab(text: 'ইভেন্ট'),
              Tab(text: 'ডোনেশন'),
              Tab(text: 'সদস্য'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Activities Tab
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ListTile(
                  title: Text('শীতবস্ত্র বিতরণ'),
                  subtitle: Text('Date: 2025-01-15'),
                ),
              ],
            ),
            // Events Tab
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ListTile(
                  title: Text('বার্ষিক সাধারণ সভা'),
                  subtitle: Text('Date: 2025-02-01'),
                ),
              ],
            ),
            // Donation Tab
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Donation logic will be added here
                },
                child: const Text('ডোনেট করুন'),
              ),
            ),
            // Members Tab
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ListTile(
                  title: Text('সভাপতি: [Name]'),
                  subtitle: Text('Contact: [Phone]'),
                ),
                ListTile(
                  title: Text('সেক্রেটারি: [Name]'),
                  subtitle: Text('Contact: [Phone]'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
