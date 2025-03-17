import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_icon.dart';
import '../../../core/constants/app_image.dart';
import '../../../core/utils/global_variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> requestEmergency = [
    {
      'status': 'In Progress',
      'type': 'Road Accident',
      'icon': AppIcon.carIcon,
      'time': '10 min ago',
    },
    {
      'status': 'Resolved',
      'type': 'Medical Help',
      'icon': AppIcon.medicalIcon,
      'time': '10 min ago',
    },
    {
      'status': 'Pending',
      'type': 'Fire',
      'icon': AppIcon.fireIcon,
      'time': 'Just posted',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcon.notificationIcon,
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.push("/emergency-request");
                },
                child: Card(
                  color: colorScheme(context).surface,
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppImage.rescueLogo,
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          "EMERGENCY HELP",
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  print("Track Rescuer");
                },
                child: Card(
                  color: colorScheme(context).surface,
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcon.trackIcon,
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                colorScheme(context).primary, BlendMode.srcIn),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Track Rescuer",
                            style: textTheme(context).bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme(context)
                                    .onSurface
                                    .withValues(alpha: 0.9)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Requests",
                    style: textTheme(context).bodyMedium?.copyWith(
                        color: colorScheme(context)
                            .onSurface
                            .withValues(alpha: 0.9)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: requestEmergency.length,
                      itemBuilder: (context, index) {
                        final request = requestEmergency[index];
                        return EmergencyRequestCard(
                            status: request['status'],
                            type: request['type'],
                            iconPath: request['icon'],
                            time: request['time'],
                          onTap: (){
                              print("onTap");
                          },
                        );
                      }),
                ),
              )

            ],
          ),
        ));
  }
}

class EmergencyRequestCard extends StatelessWidget {
  final String status;
  final String type;
  final String iconPath;
  final String time;
  final VoidCallback onTap;


  const EmergencyRequestCard(
      {super.key,
      required this.status,
      required this.type,
      required this.iconPath,
      required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: colorScheme(context).surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Status Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: getStatusColor(status).withValues(alpha: 0.1),
                  ),
                  child: Text(status,
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(color: getStatusColor(status))),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        type,
                        style: textTheme(context).titleLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          colorScheme(context).secondary.withValues(alpha: 0.1),
                      child: SvgPicture.asset(
                        iconPath, // SVG Path
                        width: 26,
                        height: 26,
                        colorFilter: ColorFilter.mode(
                          colorScheme(context).primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  time,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color:
                          colorScheme(context).onSurface.withValues(alpha: 0.8)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'In Progress':
        return Color(0xffF7C515);
      case 'Resolved':
        return Color(0xff32CA62);
      case 'Pending':
        return Color(0xff9A9CAA);
      default:
        return Color(0xff1976D2);
    }
  }
}
