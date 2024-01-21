import 'package:flutter/material.dart';
import 'package:vendor/src/view/admin_profile/screens/admin_profile_screen/widgets/index.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AdminProfileBody(),
    );
  }
}
