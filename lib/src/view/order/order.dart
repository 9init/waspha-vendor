import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/src/view/common/custom_divider/custom_divider.dart';

import '../common/alignContainer/aligned_container.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order #128",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Delivery - Online carrier - Bike",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Text("11/9/2022 11:25 AM"),
                Row(
                  children: [
                    const Text("Payment method"),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/imgs/money.svg')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text('Total EGP 7.00', style: TextStyle(fontSize: 40)),
                ),
                const CustomDivider(),
                const TextFee(
                  leading: "Waspha fee Fixed",
                  trailing: "KWD 1.00",
                  boldLeading: true,
                  size: 16,
                  credit: "",
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextFee(
                  leading: "Subtotal",
                  trailing: "KWD 5.00",
                  boldLeading: true,
                  size: 16,
                  credit: "Credit",
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFee(
                  leading: "1x item 1",
                  trailing: "FREE",
                  isFree: true,
                  size: 16,
                  credit: "",
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFee(
                  leading: "3x item 2",
                  trailing: "EGP 1.50",
                  size: 16,
                  credit: "",
                ),
                const CustomDivider(),
                const TextFee(
                  leading: "Delivery fee",
                  trailing: "EGP 1.00",
                  size: 16,
                  credit: "Credit",
                  boldLeading: true,
                ),
                const TextFee(
                  leading: "Parking fee",
                  trailing: "EGP 1.00",
                  size: 16,
                  boldLeading: true,
                  credit: "Credit",
                ),
                const CustomDivider(),
                const TextFee(
                  leading: "Wallet Added",
                  trailing: "EGP 1.20",
                  size: 16,
                  boldLeading: true,
                  credit: "Debit",
                ),
                const CustomDivider(),
                const Row(
                  children: [
                    Text("Provider - Delivery mode"),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.info)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFee(
                  leading: "Waspha fee 3%",
                  trailing: "EGP 0.15",
                  size: 16,
                  boldLeading: true,
                  credit: "Debit",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Net profit",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("EGP 5.00", style: TextStyle(fontSize: 16))
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        Text("Settlement",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("EGP 5.00", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const AlignedContainer(
            text: "Recipt",
          ),
        ],
      ),
    );
  }
}
