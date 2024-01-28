import 'package:flutter/material.dart';
import 'package:vendor/src/view/insights/insights_screen/widgets/index.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InsightsBody(),
    );
  }
}
