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
            width: 24,
            height: 24,
          )),
      title: Text(
        title,
        style: textTheme(context).bodyMedium,
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle!,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey[700],
        ),
      )
          : null, // No subtitle if null
      trailing: rightIcon != null
          ? SvgPicture.asset(
        rightIcon!,
        width: 16,
        height: 16,
      )
          : null,
      onTap: onTap,
    );
  }
}
