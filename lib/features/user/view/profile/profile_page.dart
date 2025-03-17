import 'package:alerto_emergency_response_app/core/constants/app_icon.dart';
import 'package:alerto_emergency_response_app/core/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/global_variable.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppIcon.editIcon,
                              width: 16,
                              height: 16,
                            ),
                          ),
                        )),
                  ],
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
                  height: 20,
                ),
              ],
            )));
  }
}
