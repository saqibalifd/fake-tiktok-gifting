import 'package:get/get.dart';
import 'package:tiktok/models/my_balance_model.dart';

class BalanceController extends GetxController {
  final MyBalanceModel myBalance = MyBalanceModel(
    availableReward: 3000000,
    upcomingReward: 45678,
    totalTransactionLimit: 10,
    remainingLimit: 1000000,
    totalIn: 54,
    totalOut: 54,
  );
}
