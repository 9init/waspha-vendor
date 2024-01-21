import 'package:flutter/material.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/view/update_driver_data/screens/add_new_driver_screen/widgets/index.dart';

class AddNewDriverScreen extends StatelessWidget {
  const AddNewDriverScreen({Key? key, required this.driverType})
      : super(key: key);
  final DriverType driverType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddNewDriverBody(
        driverType: driverType,
      ),
    );
  }
}
