import 'package:flutter/material.dart';
import 'package:vendor/src/view/carrier/update_driver_data/widgets/index.dart';

class UpdateDriverDataScreen extends StatelessWidget {
  const UpdateDriverDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateDriverDataBodyWidget(),
    );
  }
}
