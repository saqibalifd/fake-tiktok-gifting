import 'package:get/get.dart';
import 'package:tiktok/models/my_balance_model.dart';

class BalanceController extends GetxController {
  Rx<MyBalanceModel> myBalance = MyBalanceModel(
    availableReward: 3000000,
    upcomingReward: 45678,
    totalTransactionLimit: 10,
    remainingLimit: 1000000,
    totalIn: 54,
    totalOut: 54,
  ).obs;

  void deductBalance(double amount) {
    myBalance.value.availableReward - amount;
    myBalance.value.remainingLimit - amount;
    print(myBalance.value.availableReward);
  }
}
