import 'package:flutter/material.dart';
import 'package:chairman_para_app/core/models/user_model.dart';
import 'package:chairman_para_app/features/community/services/community_service.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CommunityService _communityService = CommunityService();
  String _searchQuery = '';
  String? _selectedBloodGroup;

  final List<String> _bloodGroups = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পাড়ার মানুষের তালিকা'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'নাম দিয়ে খুঁজুন...',
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: _selectedBloodGroup,
              decoration: const InputDecoration(labelText: 'রক্তের গ্রুপ দিয়ে ফিল্টার'),
              items: _bloodGroups.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedBloodGroup = newValue;
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: _communityService.getUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<UserModel> users = snapshot.data!;
                if (_searchQuery.isNotEmpty) {
                  users = users.where((user) => user.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
                }
                if (_selectedBloodGroup != null) {
                  users = users.where((user) => user.bloodGroup == _selectedBloodGroup).toList();
                }

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.phone),
                      trailing: Text(user.bloodGroup),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
