import 'package:flutter/material.dart';
import 'package:vendor/src/view/vendor_profile/screens/vendor_profile_screen/widgets/vendor_profile_body.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VendorProfileBody(),
    );
  }
}
