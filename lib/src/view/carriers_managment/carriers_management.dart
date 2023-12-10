import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CarrierManagementScreen extends StatefulWidget {
  const CarrierManagementScreen({super.key});

  @override
  State<CarrierManagementScreen> createState() =>
      _CarrierManagementScreenState();
}

class _CarrierManagementScreenState extends State<CarrierManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () {
        context.pop();
      })),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              context.push('/carriers_management_2', extra: {'id': 1});
            },
            title: Text(
              "Offline Carriers",
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 60.sp,
            ),
          ),
          Divider(
            color: Color(0XffE2E8ED),
          ),
          ListTile(
            onTap: () {
              context.push('/carriers_management_2', extra: {'id': 2});
            },
            title: Text(
              "Online Carriers",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 60.sp,
            ),
          ),
          Divider(
            color: Color(0XffE2E8ED),
          ),
        ],
      ),
    );
  }
}
