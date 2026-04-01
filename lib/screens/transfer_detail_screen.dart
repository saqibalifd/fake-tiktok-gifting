import 'package:flutter/material.dart';
import 'package:tiktok/models/transcation_model.dart';
import 'package:tiktok/utils/app_colors.dart';

class TransferDetailScreen extends StatefulWidget {
  final String totalAmount;
  final TransactionModel transactionModel;
  const TransferDetailScreen({
    super.key,
    required this.totalAmount,
    required this.transactionModel,
  });

  @override
  State<TransferDetailScreen> createState() => _TransferDetailScreenState();
}

class _TransferDetailScreenState extends State<TransferDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar**************************
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          'Transfer details',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 10),
            //live reward transfer ****************************
            Card(
              color: kWhiteColor,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'LIVE rewards transfer to TikTok',
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('USD', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 5),
                        Text(
                          widget.totalAmount.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            //transcript ************************************
            Card(
              color: kWhiteColor,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status', style: TextStyle(fontSize: 12)),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: kGreenColor,
                              size: 14,
                            ),
                            Text(
                              'Withdrawal complete',
                              style: TextStyle(
                                fontSize: 12,
                                color: kGreenColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    transactionTile(
                      'Payment method',
                      'TikTok(@${widget.transactionModel.receiverUsername})',
                    ),
                    transactionTile(
                      'Service fee',
                      '${widget.transactionModel.serviceFee.toStringAsFixed(1)} USD',
                    ),
                    transactionTile(
                      'Estimated amount you recieve',
                      '${widget.transactionModel.estimatedAmountReceive.toStringAsFixed(1)} USD',
                    ),
                    transactionTile('Transfer time', '03/31/2026 07:13:05 AM'),
                    transactionTile('Arival time', '03/31/2026 07:13:05 AM'),
                    transactionTile(
                      'Transcation ID',
                      '${widget.transactionModel.transactionId}',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            //button ***************************
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(kRedColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back to Rewards',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Need help?', style: TextStyle(fontSize: 12)),
                Icon(Icons.navigate_next, size: 20, color: kLightGreyColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionTile(String title, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 12)),
        Text(
          trailing,
          style: TextStyle(
            fontSize: 12,
            color: kBlackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
