import 'package:get/get.dart';
import 'package:tiktok/models/transcation_model.dart';

class TransactionController extends GetxController {
  final List<TransactionModel> transactionList = <TransactionModel>[
    TransactionModel(
      receiverUsername: 'ali',
      serviceFee: 20,
      estimatedAmountReceive: 6543,
      transactionTime: DateTime.now(),
      arrivalTime: DateTime.now(),
      transactionId: 765437654,
    ),
    TransactionModel(
      receiverUsername: 'saqib',
      serviceFee: 20,
      estimatedAmountReceive: 6543,
      transactionTime: DateTime.now(),
      arrivalTime: DateTime.now(),
      transactionId: 765437654,
    ),
    TransactionModel(
      receiverUsername: 'adeel',
      serviceFee: 20,
      estimatedAmountReceive: 6543,
      transactionTime: DateTime.now(),
      arrivalTime: DateTime.now(),
      transactionId: 765437654,
    ),
  ];
}
