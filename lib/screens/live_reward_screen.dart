import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/balance_controller.dart';
import 'package:tiktok/controllers/transaction_controller.dart';
import 'package:tiktok/screens/transfer_screen.dart';
import 'package:tiktok/utils/app_colors.dart';

class LiveRewardScreen extends StatefulWidget {
  const LiveRewardScreen({super.key});

  @override
  State<LiveRewardScreen> createState() => _LiveRewardScreenState();
}

class _LiveRewardScreenState extends State<LiveRewardScreen> {
  final BalanceController balanceController = Get.put(BalanceController());
  final TransactionController transactionController = Get.put(
    TransactionController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    balanceController;
    transactionController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar**************************
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          'LIVE rewards',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ),
        ],
      ),

      //Identity Verified**************************
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                color: kWhiteColor,
                child: ListTile(
                  title: Text(
                    'Identity verified',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Your identity is verified. You can continue with transactions',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Available Rewards**************************
              Card(
                color: kWhiteColor,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Available rewards',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'USD ${balanceController.myBalance.availableReward}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Upcoming rewards',
                            style: TextStyle(fontSize: 12),
                          ),

                          Row(
                            children: [
                              CircleAvatar(radius: 3),
                              Text(
                                'USD ${balanceController.myBalance.upcomingReward}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: kWhiteColor,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('Available rewards', style: TextStyle(fontSize: 12)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('USD ', style: TextStyle(fontSize: 12)),
                          Text(
                            balanceController.myBalance.availableReward
                                .toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('.00', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(kRedColor),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransferScreen(
                                  totalTransfer: balanceController
                                      .myBalance
                                      .remainingLimit
                                      .toStringAsFixed(0),
                                  transferLimit: balanceController
                                      .myBalance
                                      .totalTransactionLimit
                                      .toStringAsFixed(0),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Transfer',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              kWhiteColor,
                            ),
                            side: WidgetStateProperty.all(
                              BorderSide(color: kBlackColor, width: 2),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LiveRewardScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Exchange',
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ////////////////////////////////////////////////////////////////////////////////////
                      ListTile(
                        title: Text(
                          'Daily transfer limit',
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          '(Remain/Total)',
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "\$${balanceController.myBalance.remainingLimit}/\$${balanceController.myBalance.totalTransactionLimit.toStringAsFixed(0)}M",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'How to increase transfer limit?',
                            style: TextStyle(color: kRedColor, fontSize: 12),
                          ),
                          Icon(Icons.navigate_next, color: kRedColor, size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////
              //Transaction History**************************
              Card(
                color: kWhiteColor,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Mar', style: TextStyle(fontSize: 12)),
                              Text('2026', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Icon(Icons.arrow_drop_down, color: kBlackColor),
                          Column(
                            children: [
                              Text('In:', style: TextStyle(fontSize: 12)),
                              Text(
                                'USD${balanceController.myBalance.totalIn.toString()}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Out:', style: TextStyle(fontSize: 12)),
                              Text(
                                'USD${balanceController.myBalance.totalOut}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      for (
                        int i = 0;
                        i < transactionController.transactionList.length;
                        i++
                      )
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Transfer to ${transactionController.transactionList[i].receiverUsername}',
                            style: TextStyle(fontSize: 12, color: kBlackColor),
                          ),
                          subtitle: Text(
                            '03/04/2026',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text(
                            '-USD ${transactionController.transactionList[i].estimatedAmountReceive}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
