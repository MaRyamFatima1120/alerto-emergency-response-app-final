import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_icon.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/custom_list_widget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Profile",
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: textTheme(context).bodyLarge?.copyWith(
                      color: colorScheme(context).primary,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: CircleAvatar(
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
                    ),
                    Positioned(
                        bottom: 10,
                        right: 100,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            AppIcon.editIcon,
                            width: 16,
                            height: 16,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                CustomListTileWidget(
                  title: 'Full Name',
                  svgIcon: AppIcon.userIcon,
                  subtitle: 'James Smith',
                ),
                CustomListTileWidget(
                  title: 'CNIC / ID Number',
                  svgIcon: AppIcon.cnicIcon,
                  subtitle: "31202-6608846-8",
                ),
              ],
            )));
  }
}
