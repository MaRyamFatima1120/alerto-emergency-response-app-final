import 'package:alerto_emergency_response_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_icon.dart';
import '../../../../core/utils/global_variable.dart';

class EmergencyRequestPage extends StatefulWidget {
  const EmergencyRequestPage({super.key});

  @override
  State<EmergencyRequestPage> createState() => _EmergencyRequestPageState();
}

class _EmergencyRequestPageState extends State<EmergencyRequestPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emergency Request",
          style: textTheme(context)
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Emergency Type",
                    style: textTheme(context).bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Steps 1/3",
                    style: textTheme(context).titleLarge?.copyWith(
                          color: colorScheme(context).primary,
                        ),
                  ),
                ),
              ],
            ),
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
                  return EmergencyCard(
                    title: requestType['title'],
                    iconPath: requestType['icon'],

                    /*onTap: (){
                    print("onTap");
                  },*/

                  );
                }),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              pressed: () {},
              width: double.infinity,
              height: 60,
              bgColor: colorScheme(context).primary,
              child: Text("Next", style: textTheme(context).labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  final String title;
  final String iconPath;

  const EmergencyCard({super.key, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorScheme(context).surface,
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
                width:40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  colorScheme(context).primary,
                  BlendMode.srcIn,
                ),
              ),
              //Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme(context).bodyMedium?.copyWith(
                    color:
                    colorScheme(context).onSurface.withValues(alpha: 0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
