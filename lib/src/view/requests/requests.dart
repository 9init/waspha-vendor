import 'package:flutter/material.dart';
import 'package:vendor/src/view/common/profile_app_bar/profile_app_bar.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Requests', style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reorder request",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text("Grocery",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward),
                        Text("Butcher",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text("Hani Omar"),
                    Text("Delivery - Schedule on\n 05/09/2022 12:15 PM"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time_filled_rounded),
                            Text("00h:08m:23s"),
                          ],
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
