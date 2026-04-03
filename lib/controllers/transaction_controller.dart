import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/models/transcation_model.dart';
import 'package:tiktok/screens/transfer_detail_screen.dart';
import 'package:tiktok/utils/utils.dart';

class TransactionController extends GetxController {
  RxBool isLoading = false.obs;
  RxString slectedUser = ''.obs;
  RxDouble estimatedAmountYouRecieve = 0.0.obs;
  final RxList<TransactionModel> transactionList = <TransactionModel>[].obs;

  void transfer(
    TextEditingController transferAmoutController,
    TextEditingController nameController,
    BuildContext context,
  ) {
    isLoading.value = true;
    Timer(Duration(seconds: 3), () {
      try {
        var servicefee = serviceFee(double.parse(transferAmoutController.text));

        double deducted = servicefee['deduction']!;
        double remaining = servicefee['remaining']!;
        estimatedAmountYouRecieve.value = remaining;
        final TransactionModel transactionModel = TransactionModel(
          receiverUsername: nameController.text,
          serviceFee: double.parse(transferAmoutController.text),
          estimatedAmountReceive: remaining,
          transactionTime: DateTime.now(),
          arrivalTime: DateTime.now(),
          transactionId: Utils.generateRandomId(),
        );

        transactionList.add(transactionModel);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransferDetailScreen(
              totalAmount: transferAmoutController.text,
              transactionModel: TransactionModel(
                receiverUsername: nameController.text.toString(),
                serviceFee: deducted,
                estimatedAmountReceive: remaining,
                transactionTime: DateTime.now(),
                arrivalTime: DateTime.now(),
                transactionId: Utils.generateRandomId(),
              ),
            ),
          ),
        );
        update();
      } finally {
        isLoading.value = false;
      }
    });
  }

  Map<String, double> serviceFee(double totalAmount) {
    double deduction = totalAmount * 0.2;
    double remaining = totalAmount - deduction;

    return {'deduction': deduction, 'remaining': remaining};
  }
}
