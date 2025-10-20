import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chairman_para_app/features/memories/models/memory_model.dart';

class MemoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<List<MemoryModel>> getMemories() {
    return _firestore.collection('memories').orderBy('timestamp', descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => MemoryModel.fromMap(doc.data())).toList();
    });
  }

  Future<void> uploadMemory({
    required String description,
    required String userId,
    required XFile image,
  }) async {
    final ref = _storage.ref().child('memories/${DateTime.now().toIso8601String()}');
    final uploadTask = ref.putFile(File(image.path));
    final snapshot = await uploadTask.whenComplete(() {});
    final imageUrl = await snapshot.ref.getDownloadURL();

    await _firestore.collection('memories').add({
      'imageUrl': imageUrl,
      'description': description,
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
