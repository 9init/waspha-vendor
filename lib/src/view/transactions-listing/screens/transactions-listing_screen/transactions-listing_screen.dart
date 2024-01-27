import 'package:flutter/material.dart';
import 'package:vendor/src/view/common/custom_app_bar/custom_app_bar.dart';
import 'package:vendor/src/view/transactions-listing/screens/transactions-listing_screen/widgets/index.dart';

class TransactionsListingScreen extends StatelessWidget {
  const TransactionsListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
      ),
      body: TransactionsListingBody(),
    );
  }
}
