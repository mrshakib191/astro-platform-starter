import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chairman_para_app/features/memories/models/memory_model.dart';
import 'package:chairman_para_app/features/memories/services/memory_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MemoriesScreen extends StatefulWidget {
  const MemoriesScreen({super.key});

  @override
  State<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  final MemoryService _memoryService = MemoryService();
  final _descriptionController = TextEditingController();

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _memoryService.uploadMemory(
          description: _descriptionController.text,
          userId: user.uid,
          image: image,
        );
        _descriptionController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('স্মৃতি'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MemoryModel>>(
              stream: _memoryService.getMemories(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final memory = snapshot.data![index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(memory.imageUrl),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(memory.description),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'বর্ণনা লিখুন...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: _pickAndUploadImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
