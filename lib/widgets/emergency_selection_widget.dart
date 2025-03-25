import 'package:alerto_emergency_response_app/widgets/rounded_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_icon.dart';
import '../core/routes/go_routes.dart';
import '../core/utils/global_variable.dart';
import '../core/utils/snackbar_helper.dart';
import '../features/user/provider/emergency_request_provider.dart';

class EmergencySelectionWidget extends StatelessWidget {
  const EmergencySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emergencyProvider = Provider.of<EmergencyRequestProvider>(context);
    final List<Map<String, dynamic>> emergencyType = [
      {
        "title": "Medical Emergency",
        "icon": AppIcon.medicalIcon,
      },
      {
        "title": "Road Accident",
        "icon": AppIcon.carIcon,
      },
      {
        "title": "Fire",
        "icon": AppIcon.fireIcon,
      },
      {
        "title": "Robbery",
        "icon": AppIcon.robberyIcon,
      },
      {
        "title": "Others",
        "icon": AppIcon.robberyIcon,
      },
    ];
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: emergencyType.length,
            itemBuilder: (context, index) {
              final requestType = emergencyType[index];
              final isSelected = emergencyProvider.selectedEmergency ==
                  requestType['title'];

              return GestureDetector(
                onTap: () {
                  //store title
                  emergencyProvider
                      .selectEmergency(requestType['title']!);
                  print(requestType['title']);
                },
                child: EmergencyCard(
                  title: requestType['title'],
                  iconPath: requestType['icon'],
                  isSelected: isSelected,

                  /*onTap: (){
                      print("onTap");
                    },*/
                ),
              );
            }),
        SizedBox(
          height: 15,
        ),
        CustomButton(
          pressed: () {
            if (emergencyProvider.selectedEmergency == null || emergencyProvider.selectedEmergency!.isEmpty){
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Alert!',
                  message:
                  "Please Select Type.It's Compulsory",
                  contentType: ContentType.help,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              return;

            }
            GoRouter.of(context).pushNamed(
              AppRoute.emergencyRequestHelpPage,
              extra: emergencyProvider.selectedEmergency,
            );
          },
          width: double.infinity,
          height: 60,
          bgColor: colorScheme(context).primary,
          child: Text("Next", style: textTheme(context).labelLarge),
        ),
      ],
    );
  }
}
class EmergencyCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;

  const EmergencyCard(
      {super.key,
        required this.title,
        required this.iconPath,
        required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected
          ? colorScheme(context).primary
          : colorScheme(context).surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: SizedBox(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Icon
              SvgPicture.asset(
                iconPath, // SVG Path
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? colorScheme(context).surface
                      : colorScheme(context).primary,
                  BlendMode.srcIn,
                ),
              ),
              //Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme(context).bodyMedium?.copyWith(
                    color: isSelected
                        ? colorScheme(context).surface
                        : colorScheme(context)
                        .onSurface
                        .withValues(alpha: 0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}