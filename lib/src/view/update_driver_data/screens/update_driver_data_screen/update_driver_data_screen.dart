import 'package:flutter/material.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/update_driver_data_body_widget.dart';

class UpdateDriverDataScreen extends StatelessWidget {
  const UpdateDriverDataScreen({
    Key? key,
    required this.driverId,
    // required this.isAddNewDriver,
  }) : super(key: key);
  final String driverId;
  // final bool isAddNewDriver;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: UpdateDriverDataBodyWidget(
          driverId: driverId,
        ),
      ),
    );
  }
}
