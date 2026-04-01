class MyBalanceModel {
  final double availableReward;
  final double upcomingReward;
  final double totalTransactionLimit;
  final double remainingLimit;
  final double totalIn;
  final double totalOut;

  MyBalanceModel({
    required this.availableReward,
    required this.upcomingReward,
    required this.totalTransactionLimit,
    required this.remainingLimit,
    required this.totalIn,
    required this.totalOut,
  });

  // Factory constructor to create from JSON
  factory MyBalanceModel.fromJson(Map<String, dynamic> json) {
    return MyBalanceModel(
      availableReward: (json['availableReward'] ?? 0).toDouble(),
      upcomingReward: (json['upcomingReward'] ?? 0).toDouble(),
      totalTransactionLimit: (json['totalTransactionLimit'] ?? 0).toDouble(),
      remainingLimit: (json['remainingLimit'] ?? 0).toDouble(),
      totalIn: (json['totalIn'] ?? 0).toDouble(),
      totalOut: (json['totalOut'] ?? 0).toDouble(),
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'availableReward': availableReward,
      'upcomingReward': upcomingReward,
      'totalTransactionLimit': totalTransactionLimit,
      'remainingLimit': remainingLimit,
      'totalIn': totalIn,
      'totalOut': totalOut,
    };
  }
}
