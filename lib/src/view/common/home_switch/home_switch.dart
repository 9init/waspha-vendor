import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/core/constans/dimension/dimensions.dart';

class HomeSwitcher extends StatelessWidget {
  const HomeSwitcher({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.switchTitle,
  });

  final Function(bool) onChanged;
  final String title;
  final bool value;
  final String switchTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: value ? Color(0xff00FF00) : Color(0xffFF0000),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  switchTitle,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: AppDimensions.textSizeExtraLarge),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 10,
                  child: Transform.scale(
                    scale: 0.5,
                    child: Switch(
                      value: value,
                      onChanged: onChanged,
                      activeColor: Colors.white,
                      trackOutlineColor:
                          MaterialStateProperty.all(Colors.white),
                      inactiveTrackColor: Colors.transparent,
                      inactiveThumbColor: Colors.white,
                      activeTrackColor: Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),

        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: AppDimensions.textSizeExtraLarge),
        ),
      ],
    );
  }
}
