import 'package:tiktok/models/my_balance_model.dart';

class BalanceService {
  // Singleton pattern to access balance globally
  static final BalanceService _instance = BalanceService._internal();

  factory BalanceService() {
    return _instance;
  }

  BalanceService._internal();

  // List to hold balances
  List<MyBalanceModel> balances = [];

  // Method to initialize balances on app startup
  void initializeBalances() {
    balances = [
      MyBalanceModel(
        availableReward: 120.50,
        upcomingReward: 50.00,
        totalTransactionLimit: 1000.0,
        remainingLimit: 880.50,
        totalIn: 654,
        totalOut: 6543,
      ),
      MyBalanceModel(
        availableReward: 200.00,
        upcomingReward: 75.00,
        totalTransactionLimit: 1500.0,
        remainingLimit: 1225.00,
        totalIn: 654,
        totalOut: 7654,
      ),
      // Add more entries if needed
    ];
  }

  // Optional helper to get balance by index
  MyBalanceModel? getBalance(int index) {
    if (index >= 0 && index < balances.length) {
      return balances[index];
    }
    return null;
  }

  // Optional helper to get total available rewards
  double getTotalAvailableRewards() {
    return balances.fold(0, (sum, balance) => sum + balance.availableReward);
  }
}
