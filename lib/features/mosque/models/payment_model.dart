class PaymentModel {
  final double amount;
  final String month;
  final DateTime timestamp;
  final String status;

  PaymentModel({
    required this.amount,
    required this.month,
    required this.timestamp,
    required this.status,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> data) {
    return PaymentModel(
      amount: data['amount'],
      month: data['month'],
      timestamp: (data['timestamp'] as dynamic).toDate(),
      status: data['status'],
    );
  }
}
