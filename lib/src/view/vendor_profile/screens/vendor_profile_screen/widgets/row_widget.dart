import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key, required this.title, required this.svgPath})
      : super(key: key);
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ).paddingRow(paddingTop: 30,paddingLeft: 10),
    );
  }
}

List<Widget> rowsWidget(BuildContext context) {
  return [
    RowWidget(
      title: context.localization.help,
      svgPath: MyAssets.svg.float.path,
    ),
    RowWidget(
      title: context.localization.team_members,
      svgPath: MyAssets.svg.people.path,
    ),
    RowWidget(
      title: context.localization.invite_earn,
      svgPath: MyAssets.svg.gift.path,
    ),
    RowWidget(
      title: context.localization.setting,
      svgPath: MyAssets.svg.settings.path,
    ),
    RowWidget(
      title: context.localization.legal,
      svgPath: MyAssets.svg.information.path,
    ),
  ];
}
