import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getPaymentHistory(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('payments')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> makePayment({
    required String userId,
    required double amount,
    required String month,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('payments')
        .add({
      'amount': amount,
      'month': month,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'paid',
    });
  }
}
