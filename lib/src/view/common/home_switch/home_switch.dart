import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSwitcher extends StatelessWidget {
  const HomeSwitcher({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final Function(bool) onChanged;
  final String title;
  final bool value;

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
                SizedBox(height: 10),
                Text(
                  "On",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
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
        Text(
          title,
          style: TextStyle(
            fontSize: 45.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
