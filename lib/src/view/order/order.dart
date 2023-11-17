import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFDFFF5),
        appBar: AppBar(
          title: const Text('Payouts'),
        ),
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Today"), Icon(Icons.upload)],
            ),
            Container(
              width: 348,
              height: 320,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                  const Text("11/9/2022 11:25 AM"),
                  const Text("Settlement# 128"),
                  const Text("Waspha -> Provider"),
                  const Text("Waspha Payout"),
                  const Text("Bank transfer")
                ],
              ),
            )
          ],
        ));
  }
}
