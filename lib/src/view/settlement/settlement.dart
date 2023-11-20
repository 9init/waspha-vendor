import 'package:flutter/material.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class Settlement extends StatelessWidget {
  const Settlement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WasphaColors.background,
      appBar: AppBar(
        backgroundColor: WasphaColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settlemnt# 128",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Provider Payout",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const Text(
              "11/9/2022 11:25 AM",
              style: TextStyle(fontSize: 13),
            ),
            const Text("Payment method: Bank transfer"),
            const SizedBox(
              height: 20,
            ),
            const Text("Amount", style: TextStyle(fontSize: 40)),
            const Text(
              "EGP 20.00",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Old Balance"),
                      Text("-EGP 20.00", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                  Column(
                    children: [
                      Text("New Balance"),
                      Text("EGP 20.00", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Recipt"),
            ),
            Image.network(
                "https://www.generalblue.com/business-receipt-template/p/t6qm6jw81/f/printable-business-receipt-template-in-pdf-md.png?v=0c36440f9af661eef6dde6426a18975b")
          ],
        ),
      ),
    );
  }
}
