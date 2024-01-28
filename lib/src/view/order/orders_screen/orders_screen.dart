import 'package:flutter/material.dart';
import 'package:vendor/src/view/order/orders_screen/widgets/index.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrdersViewBody(),
    );
  }
}
