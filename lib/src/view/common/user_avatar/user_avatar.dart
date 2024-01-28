import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

enum BackgroundImageType { memory, file, network, assets }

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.radius,
    required this.backgroundColor,
    required this.imageType,
    this.imageUrl,
    this.child,
    this.hasRadiusColor = false,
    this.borderRadiusColor,
  }) : super(key: key);
  final double radius;
  final Color backgroundColor;
  final Color? borderRadiusColor;
  final BackgroundImageType imageType;
  final String? imageUrl;
  final Widget? child;
  final bool hasRadiusColor;

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;

    if (imageUrl != null) {
      switch (imageType) {
        case BackgroundImageType.memory:
          imageProvider = MemoryImage(
            base64Decode(imageUrl!),
          );
          break;
        case BackgroundImageType.file:
          imageProvider = FileImage(File(imageUrl!));
          break;
        case BackgroundImageType.network:
          imageProvider = CachedNetworkImageProvider(
            imageUrl!,
          );
          break;
        case BackgroundImageType.assets:
          imageProvider = AssetImage(imageUrl!);
          break;
      }
    }
    return Container(
      decoration: hasRadiusColor
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: borderRadiusColor ?? WasphaColors.blackColor),
            )
          : null,
      child: CircleAvatar(
        radius: radius.r,
        backgroundColor: backgroundColor,
        backgroundImage: imageProvider != null ? imageProvider : null,
        child: child,
      ),
    );
  }
}
