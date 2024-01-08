import 'package:flutter/material.dart';
import 'package:vendor/src/view/update_driver_data/screens/add_new_driver_screen/widgets/index.dart';

class AddNewDriverScreen extends StatelessWidget {
  const AddNewDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddNewDriverBody(),
    );
  }
}
