import 'package:alerto_emergency_response_app/core/utils/snackbar_helper.dart';
import 'package:alerto_emergency_response_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_icon.dart';
import '../core/utils/global_variable.dart';
import '../core/utils/location_helper.dart';
import '../features/user/provider/emergency_request_provider.dart';
import 'emergency_card_widget.dart';

class EmergencySelectionWidget extends StatelessWidget {
  const EmergencySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emergencyProvider = Provider.of<EmergencyRequestProvider>(context);
    final List<Map<String?, dynamic>> emergencyType = [
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
              final isSelected =
                  emergencyProvider.selectedEmergency == requestType['title'];

              return GestureDetector(
                onTap: () {
                  //store title
                  emergencyProvider.selectEmergency(requestType['title']!,requestType['icon']!);
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
            if (emergencyProvider.selectedEmergency == null ||
                emergencyProvider.selectedEmergency!.isEmpty) {
              CustomSnackBar.show(context,
                  message: "Please select an emergency type before proceeding.",
                  duration: Duration(seconds: 2));

              return;
            }
            _getLocationAndMove(context);

          },
          width: double.infinity,
          height: 60,
          bgColor: colorScheme(context).primary,
          color: colorScheme(context).primary,
          child: Text("Next", style: textTheme(context).labelLarge),
        ),
      ],
    );
  }

  // Function to fetch user location and update map
  Future<void> _getLocationAndMove(BuildContext context) async {
    final emergencyProvider =
        Provider.of<EmergencyRequestProvider>(context, listen: false);
    String? selectedEmergencyType = emergencyProvider.selectedEmergency;
    String? selectedEmergencyIcon= emergencyProvider.selectedEmergencyIcon;
    try {
      var position = await LocationUtils.getUserCurrentLocation();

      // Navigate to next screen with fetched location

      print(position.latitude);
      print(position.longitude);
      context.push('/emergencyRequest-help', extra: {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'selectedEmergency': selectedEmergencyType,
        'selectedEmergencyIcon':selectedEmergencyIcon,
      });
    } catch (e) {
      print("Error: $e");
      CustomSnackBar.show(
        context,
        message: "Failed to get location: $e",
      );
    }
  }


}

