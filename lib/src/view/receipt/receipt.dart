import 'package:flutter/material.dart';

import '../common/alignContainer/aligned_container.dart';
import '../common/custom_divider/custom_divider.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Receipt"),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: SizedBox(
                      width: 130,
                      child: Text("Hani, shukran for using Waspha",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Offer #128", style: TextStyle(fontSize: 16)),
                      Text("Delivery", style: TextStyle(fontSize: 16)),
                      Text("20/8/2021 11:23 AM",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Noon Express ..",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("To be paid", style: TextStyle(fontSize: 13)),
            const Text("PAID",
                style: TextStyle(
                  fontSize: 25,
                )),
            const CustomDivider(),
            const SizedBox(
              height: 20,
            ),
            const Text("Payment methods", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 30,
                  ),
                  Text("Online Payments", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            const Text("KWD 7.00",
                style: TextStyle(
                  fontSize: 25,
                )),
            const CustomDivider(),
            const SizedBox(
              height: 20,
            ),
            const Text("Receipt details", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: FittedBox(
                  child: Text(
                    "Total KWD 777.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomDivider(),
            const Padding(
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Waspha fee", style: TextStyle(fontSize: 20)),
                  Text("KWD 1.00", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            const CustomDivider(),
            const Padding(
                padding: EdgeInsets.all(13),
                child: TextFee(
                  leading: "Subtotal",
                  trailing: "KWD 6.00",
                  size: 16,
                )),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFee(leading: "1 x Item 1", trailing: "FREE"));
                }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFee(leading: "Delivery fee", trailing: "KWD 1.00")),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFee(
                leading: "Parking fee",
                trailing: "KWD 1.00",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text("51fdfdf"),
              leading: Icon(Icons.download_for_offline_rounded),
            ),
            const ListTile(
              title: Text("51fdfdf"),
              leading: Icon(Icons.location_on),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/250?image=9'),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Mustafa"),
                          SizedBox(width: 10),
                          Text('4.9'),
                          Icon(Icons.star)
                        ],
                      ),
                      Text("Scooter - Honda")
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const AlignedContainer(
              text: "Print Receipt",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF663399),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Resend by email",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
