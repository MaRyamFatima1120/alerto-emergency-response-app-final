import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/global_variable.dart';

class SvgPictureIcon extends StatelessWidget {
  final String iconPath;
  final int index;
  final int currentPage;

  const SvgPictureIcon(
      {super.key,
      required this.iconPath,
      required this.index,
      required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: 30,
      height: 30,
      colorFilter: ColorFilter.mode(
          currentPage == index
              ? colorScheme(context).primary
              : colorScheme(context)
          .onSurface
          .withValues(alpha: 0.9),
          BlendMode.srcIn),
    );
  }
}
