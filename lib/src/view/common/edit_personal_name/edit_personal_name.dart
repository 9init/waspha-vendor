import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class EditPersonalName extends StatelessWidget {
  const EditPersonalName({Key? key, required this.personalName, required this.editPersonalNameFunction}) : super(key: key);
  final String personalName;
  final VoidCallback editPersonalNameFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      // width: 250.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap:editPersonalNameFunction ,
            child: Align(
              alignment: Alignment(personalName.length>10?-0.8:-0.4, -2.4),
              child: CircleAvatar(
                backgroundColor: WasphaColors.darkBlackColor,
                child:  Icon(
                    Icons.edit,
                    color: WasphaColors.white,
                  ),
                ),
              ),
            ),
          Text(
            personalName,
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
