import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTileWidget extends StatelessWidget {
  final String title;
  final String svgIcon;
  final String? rightIcon;
  final VoidCallback? onTap;
  final String? subtitle;

  const CustomListTileWidget(
      {super.key,
      required this.title,
      required this.svgIcon,
      this.onTap,
      this.rightIcon,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: colorScheme(context).surface,
          child: SvgPicture.asset(
            svgIcon,
            width: 20,
            height: 20,
          )),
      title: Text(
        title,
        style: textTheme(context).bodyMedium?.copyWith(
          fontWeight: FontWeight.w600
        ),
       /* textAlign: subtitle == null ? TextAlign.start : TextAlign.start,*/
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle!,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme(context).onSurface.withValues(alpha: 0.8),
        ),
      )
          : null, // No subtitle if null
      trailing: rightIcon != null
          ? SvgPicture.asset(
        rightIcon!,
        width: 24,
        height: 24,
      )
          : null,
      onTap: onTap,
    );
  }
}
