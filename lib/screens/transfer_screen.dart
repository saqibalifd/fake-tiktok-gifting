import 'package:flutter/material.dart';
import 'package:tiktok/models/transcation_model.dart';
import 'package:tiktok/models/user_model.dart';
import 'package:tiktok/screens/transfer_detail_screen.dart';
import 'package:tiktok/utils/app_colors.dart';
import 'package:tiktok/utils/utils.dart';

class TransferScreen extends StatefulWidget {
  final String? transferLimit;
  final String? totalTransfer;
  const TransferScreen({super.key, this.transferLimit, this.totalTransfer});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final List<User> listUsers = <User>[
    User(username: 'ali', profileImage: 'assets/saqib.jpeg'),
    User(username: 'saqib', profileImage: 'assets/saqib.jpeg'),

    User(username: 'adeel', profileImage: 'assets/saqib.jpeg'),

    User(username: 'anas', profileImage: 'assets/saqib.jpeg'),
  ];

  final User slectedUser = User(
    username: 'Ali',
    profileImage: 'assets/saqib.jpeg',
  );

  final TextEditingController nameController = TextEditingController();
  final TextEditingController transferAmoutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar**************************
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          'Transfer',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.help_outline),
          ),
        ],
        centerTitle: true,
        forceMaterialTransparency: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            // Payment method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment method', style: TextStyle(fontSize: 12)),
                Text(
                  'Manage',
                  style: TextStyle(fontSize: 12, color: kRedColor),
                ),
              ],
            ),
            //transfer name
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kBlackColor,
                    backgroundImage: AssetImage('assets/tiktoklogo.png'),
                  ),
                ),

                Text('Transfer name', style: TextStyle(fontSize: 12)),
                Text(
                  '(Username Details)',
                  style: TextStyle(fontSize: 12, color: kLightGreyColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Icon(Icons.navigate_next, color: kBlackColor),
                ),
              ],
            ),

            //enter name text field
            Card(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Enter Tiktok username',
                    hintStyle: TextStyle(fontSize: 12),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 25,
                      minHeight: 25,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      size: 16,
                      color: kBlackColor,
                    ),
                  ),
                ),
              ),
            ),
            // daily user limit
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily transfer limit (Remain/Total)',
                    style: TextStyle(fontSize: 12, color: kLightGreyColor),
                  ),
                  Text('${widget.totalTransfer}/${widget.transferLimit}M'),
                ],
              ),
            ),
            //total ammount field
            Card(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transfer amount',
                      style: TextStyle(fontSize: 12, color: kLightGreyColor),
                    ),
                    Row(
                      children: [
                        Text(
                          'USD ',
                          style: TextStyle(
                            fontSize: 12,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: transferAmoutController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 22, color: kBlackColor),

                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,

                              hintText: '0',
                              hintStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'All',
                          style: TextStyle(fontSize: 12, color: kRedColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //estimated ammount recieve
            Card(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Estimated amount you recieve',
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(Icons.help_outline, color: kBlackColor, size: 15),
                      ],
                    ),
                    Text(
                      'USD ${transferAmoutController.text}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottom text + button
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'TikTok Terms of Services and Privacy Policy. Payment\ntransactions are processed by PIPO Privacy Policy',
                style: TextStyle(fontSize: 12, color: kLightGreyColor),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(kRedColor),
                  ),
                  onPressed: () {
                    var servicefee = serviceFee(
                      double.parse(transferAmoutController.text),
                    );

                    double deducted = servicefee['deduction']!;
                    double remaining = servicefee['remaining']!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransferDetailScreen(
                          totalAmount: transferAmoutController.text,
                          transactionModel: TransactionModel(
                            receiverUsername: slectedUser.username,
                            serviceFee: deducted,
                            estimatedAmountReceive: remaining,
                            transactionTime: DateTime.now(),
                            arrivalTime: DateTime.now(),
                            transactionId: Utils.generateRandomId(),
                          ),
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
            ],
          ),
        ),
      ),
    );
  }

  Map<String, double> serviceFee(double totalAmount) {
    double deduction = totalAmount * 0.2;
    double remaining = totalAmount - deduction;

    return {'deduction': deduction, 'remaining': remaining};
  }
}
