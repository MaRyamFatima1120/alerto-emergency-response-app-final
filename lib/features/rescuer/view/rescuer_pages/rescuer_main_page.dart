import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:alerto_emergency_response_app/features/rescuer/view/rescuer_pages/rescuer_emergency_page.dart';
import 'package:alerto_emergency_response_app/features/rescuer/view/rescuer_pages/rescuer_home_page.dart';
import 'package:alerto_emergency_response_app/features/user/provider/main_page_provider.dart';
import 'package:alerto_emergency_response_app/features/user/view/track_rescuer_page.dart';
import 'package:alerto_emergency_response_app/features/user/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_icon.dart';
import '../../../../widgets/svgpicture_icon.dart';

class RescuerMainPage extends StatefulWidget {
  const RescuerMainPage({super.key});

  @override
  State<RescuerMainPage> createState() => _RescuerMainPageState();
}

class _RescuerMainPageState extends State<RescuerMainPage> {
  final List<Widget> pages = const [
    RescuerHomePage(),
    RescuerEmergencyPage(),
    TrackRescuerPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainPageProvider = Provider.of<MainPageProvider>(context);
    return Scaffold(
      body: pages[mainPageProvider.currentPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: colorScheme(context).onSurface,
          selectedItemColor: colorScheme(context).primary,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          currentIndex: mainPageProvider.currentPage,

          onTap: (value) {
            mainPageProvider.setCurrentPage(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPictureIcon(
                  iconPath: AppIcon.homeIcon,
                  index: 0,
                  currentPage: mainPageProvider.currentPage,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPictureIcon(
                  iconPath: AppIcon.emergencyIcon,
                  index: 1,
                  currentPage: mainPageProvider.currentPage,
                ),
                label: "Emergencies"),
            BottomNavigationBarItem(
                icon: SvgPictureIcon(
                  iconPath: AppIcon.trackIcon,
                  index: 2,
                  currentPage: mainPageProvider.currentPage,
                ),
                label: "Track Rescuer "),
            BottomNavigationBarItem(
                icon: SvgPictureIcon(
                  iconPath: AppIcon.profileIcon,
                  index: 3,
                  currentPage: mainPageProvider.currentPage,
                ),
                label: "Profile"),
          ]),
    );
  }
}
