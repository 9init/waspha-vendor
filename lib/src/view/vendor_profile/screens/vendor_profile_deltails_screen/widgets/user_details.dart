import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class UserDetails extends StatelessWidget {
  const UserDetails(
      {Key? key,
       this.isVerified,
      required this.title,
      required this.subTitle})
      : super(key: key);
  final bool ?isVerified;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: AppDimensions.semiBold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Gap(10.w),
                if (isVerified != null)
                  isVerified!
                      ? Text(
                    context.localization.verified,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: WasphaColors.redColor,
                    ),
                  )
                      : Text(
                    context.localization.unverified,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: WasphaColors.redColor,
                    ),
                  ),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    color: WasphaColors.blackColor,
                  ),
                ),
              ],
            ),
            subtitle:
                Text(subTitle, style: Theme.of(context).textTheme.titleMedium),
          ),
          Divider(
            color: WasphaColors.lightBlue,
            indent: 30,
            endIndent: 40,
          ),
        ],
      ),
    );
  }
}
