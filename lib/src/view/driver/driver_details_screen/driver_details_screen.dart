import 'package:flutter/material.dart';
import 'package:vendor/src/view/driver/driver_details_screen/widgets/index.dart';

class DriverDetailsScreen extends StatelessWidget {
  const DriverDetailsScreen({Key? key, required this.driverId})
      : super(key: key);
  final String driverId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DriverScreenBody(driverId: driverId),
    );
  }
}
