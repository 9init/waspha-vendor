import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CircleAvatar(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Home',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Row(
              children: [
                CircleWithText(),
                Spacer(),
                CircleWithText(
                  text: 'Delivery',
                ),
                SizedBox(
                  width: 10,
                ),
                CircleWithText(
                  text: 'Pickup',
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.push('/order');
              },
              child: Center(
                child: Container(
                  width: 348,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.grey,
                      ],
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Total Net Profit",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "EGP 1,000,000",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "- 400",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          VerticalDivider(),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text("Today Net Profit",
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                "EGP 21.4",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.arrow_forward)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: [
                            Text("Payouts", style: TextStyle(fontSize: 20)),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      Text("Last update 11/9/2022 11:25 AM")
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
                alignment: Alignment.centerRight, child: Text("Dismiss all"))
          ],
        ),
      ),
    );
  }
}

class CircleWithText extends StatelessWidget {
  const CircleWithText({
    super.key,
    this.text = 'Box',
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 25,
        ),
        Text(text)
      ],
    );
  }
}
