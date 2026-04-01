import 'package:tiktok/models/transcation_model.dart';

class TransactionService {
  // Singleton pattern to access data globally
  static final TransactionService _instance = TransactionService._internal();

  factory TransactionService() {
    return _instance;
  }

  TransactionService._internal();

  // List to hold transactions
  List<TransactionModel> transactions = [];

  // Method to initialize transactions on app startup
  void initializeTransactions() {
    transactions = [
      TransactionModel(
        receiverUsername: "Alice",
        serviceFee: 1.50,
        estimatedAmountReceive: 98.50,
        transactionTime: DateTime.now().subtract(const Duration(hours: 2)),
        arrivalTime: DateTime.now().add(const Duration(hours: 1)),
        transactionId: 100001,
      ),
      TransactionModel(
        receiverUsername: "Bob",
        serviceFee: 2.00,
        estimatedAmountReceive: 248.00,
        transactionTime: DateTime.now().subtract(const Duration(days: 1)),
        arrivalTime: DateTime.now().add(const Duration(hours: 3)),
        transactionId: 100002,
      ),
      TransactionModel(
        receiverUsername: "Charlie",
        serviceFee: 0.75,
        estimatedAmountReceive: 49.25,
        transactionTime: DateTime.now().subtract(const Duration(days: 2)),
        arrivalTime: DateTime.now().subtract(const Duration(hours: 5)),
        transactionId: 100003,
      ),
      TransactionModel(
        receiverUsername: "Diana",
        serviceFee: 3.00,
        estimatedAmountReceive: 497.00,
        transactionTime: DateTime.now().subtract(const Duration(days: 3)),
        arrivalTime: DateTime.now().subtract(const Duration(days: 2)),
        transactionId: 100004,
      ),
      TransactionModel(
        receiverUsername: "Eve",
        serviceFee: 1.25,
        estimatedAmountReceive: 73.75,
        transactionTime: DateTime.now().subtract(const Duration(days: 4)),
        arrivalTime: DateTime.now().subtract(const Duration(days: 3)),
        transactionId: 100005,
      ),
    ];
  }

  // Get a transaction by ID
  TransactionModel? getTransactionById(int transactionId) {
    return transactions.firstWhere(
      (tx) => tx.transactionId == transactionId,
      orElse: () => TransactionModel(
        receiverUsername: "Unknown",
        serviceFee: 0,
        estimatedAmountReceive: 0,
        transactionTime: DateTime.now(),
        arrivalTime: DateTime.now(),
        transactionId: -1,
      ),
    );
  }

  // Get all transactions for a specific receiver
  List<TransactionModel> getTransactionsByReceiver(String username) {
    return transactions.where((tx) => tx.receiverUsername == username).toList();
  }

  // Add a new transaction
  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);
  }
}
