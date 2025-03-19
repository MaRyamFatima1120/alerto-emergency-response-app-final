import 'package:alerto_emergency_response_app/core/constants/app_icon.dart';
import 'package:alerto_emergency_response_app/core/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/custom_list_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> profileData = [
    {
      'title': 'Personal Info',
      "icon": AppIcon.userIcon,
    },
    {
      'title': 'Personal Info',
      "icon": AppIcon.userIcon,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: [
                CircleAvatar(
                  radius: 63,
                  backgroundColor: colorScheme(context)
                      .onSurface
                      .withValues(alpha: 0.1),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: colorScheme(context).surface,
                    backgroundImage: AssetImage(
                      AppImage.profileImage,
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  "James Smith",
                  style: textTheme(context).headlineMedium,
                ),
                Text.rich(
                  TextSpan(
                      text: 'ID: ',
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(
                          text: 'smithjames123',
                          style: textTheme(context).bodyLarge,
                        )
                      ]),
                ),
                Text(
                  "smithjames123@gmail.com",
                  style: textTheme(context).bodyLarge,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomListTileWidget(
                  title: 'Personal Info',
                  svgIcon: AppIcon.userIcon,
                  onTap: () {
                    context.push("/personalInfo-page");
                  },
                  rightIcon: AppIcon.rightArrowIcon,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomListTileWidget(
                  title: 'Settings',
                  svgIcon: AppIcon.settingIcon,
                  onTap: () {},
                  rightIcon: AppIcon.rightArrowIcon,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomListTileWidget(
                  title: 'Rescuer Reviews',
                  svgIcon: AppIcon.commandIcon,
                  onTap: () {},
                  rightIcon: AppIcon.rightArrowIcon,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomListTileWidget(
                  title: 'Log Out',
                  svgIcon: AppIcon.downloadIcon,
                  onTap: () {},
                  rightIcon: AppIcon.rightArrowIcon,
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            )));
  }
}
