class MemoryModel {
  final String imageUrl;
  final String description;
  final DateTime timestamp;
  final String userId;

  MemoryModel({
    required this.imageUrl,
    required this.description,
    required this.timestamp,
    required this.userId,
  });

  factory MemoryModel.fromMap(Map<String, dynamic> data) {
    return MemoryModel(
      imageUrl: data['imageUrl'],
      description: data['description'],
      timestamp: (data['timestamp'] as dynamic).toDate(),
      userId: data['userId'],
    );
  }
}
