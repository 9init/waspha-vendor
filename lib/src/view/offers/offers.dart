import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/profile_app_bar/profile_app_bar.dart';

class OffersScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isPickerClicked = useState(false);

    return Scaffold(
      appBar: ProfileAppBar(title: "Offers"),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) => SizedBox(
                      height: 42,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: "pickup",
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Pickup",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "pickup",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Delivery",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "delivery",
                            ),
                          ],
                          onChanged: (v) async {},
                          dropdownColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
