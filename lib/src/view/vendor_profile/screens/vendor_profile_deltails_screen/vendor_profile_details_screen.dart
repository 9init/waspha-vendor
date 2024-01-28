import 'package:flutter/material.dart';
import 'package:vendor/src/view/vendor_profile/screens/vendor_profile_deltails_screen/widgets/index.dart';

class VendorProfileDetailsScreen extends StatelessWidget {
  const VendorProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VendorProfileDetailsBody(),
    );
  }
}
