import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CarriersManagement2Screen extends StatefulWidget {
  final int? id;
  const CarriersManagement2Screen({super.key, this.id});

  @override
  State<CarriersManagement2Screen> createState() =>
      _CarriersManagement2ScreenState();
}

class _CarriersManagement2ScreenState extends State<CarriersManagement2Screen> {
  // id ==1 => offline carrier management
  // id ==2 => online carrier management

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () {
        context.pop();
      })),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.id == 1 ? "Offline Carriers" : "Online Carriers",
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
