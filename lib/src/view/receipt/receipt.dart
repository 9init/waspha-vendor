import 'package:flutter/material.dart';

class Reciept extends StatelessWidget {
  const Reciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reciept"),
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
              padding: EdgeInsets.symmetric(horizontal: 13),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Divider(
                thickness: 2,
              ),
            ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Divider(
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Receipt details", style: TextStyle(fontSize: 13)),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text("KWD 7.00",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Divider(
                thickness: 2,
              ),
            ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(13),
                child: TextFee(
                  leading: "Subtotal",
                  trailing: "KWD 6.00",
                  size: 16,
                )),
            Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const Padding(
                          padding: EdgeInsets.all(13),
                          child:
                              TextFee(leading: "1 x Item 1", trailing: "FREE"));
                    })),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: TextFee(leading: "Delivery fee", trailing: "KWD 1.00")),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: Color(0xFF663399),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: const Center(
                    child: Text("Print Receipt",
                        style: TextStyle(color: Colors.white, fontSize: 14))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF663399),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      "Resend by email",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}

class TextFee extends StatelessWidget {
  const TextFee({
    super.key,
    required this.leading,
    required this.trailing,
    this.size = 14,
  });
  final String leading;
  final String trailing;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading, style: TextStyle(fontSize: size)),
        Text(trailing, style: TextStyle(fontSize: size)),
      ],
    );
  }
}
