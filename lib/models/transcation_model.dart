class TransactionModel {
  final String receiverUsername;
  final double serviceFee;
  final double estimatedAmountReceive;
  final DateTime transactionTime;
  final DateTime arrivalTime;
  final int transactionId;

  TransactionModel({
    required this.receiverUsername,
    required this.serviceFee,
    required this.estimatedAmountReceive,
    required this.transactionTime,
    required this.arrivalTime,
    required this.transactionId,
  });

  // Factory constructor to create from JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      receiverUsername: json['receiverUsername'] ?? '',
      serviceFee: (json['serviceFee'] ?? 0).toDouble(),
      estimatedAmountReceive: (json['estimatedAmountReceive'] ?? 0).toDouble(),
      transactionTime: json['transactionTime'] != null
          ? DateTime.parse(json['transactionTime'])
          : DateTime.now(),
      arrivalTime: json['arrivalTime'] != null
          ? DateTime.parse(json['arrivalTime'])
          : DateTime.now(),
      transactionId: (json['transactionId'] ?? 0).toInt(),
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'receiverUsername': receiverUsername,
      'serviceFee': serviceFee,
      'estimatedAmountReceive': estimatedAmountReceive,
      'transactionTime': transactionTime.toIso8601String(),
      'arrivalTime': arrivalTime.toIso8601String(),
      'transactionId': transactionId,
    };
  }
}
