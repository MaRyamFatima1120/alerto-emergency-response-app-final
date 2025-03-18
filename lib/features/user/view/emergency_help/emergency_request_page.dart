import 'package:flutter/material.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/emergency_selection_widget.dart';


class EmergencyRequestPage extends StatefulWidget {
  const EmergencyRequestPage({super.key});

  @override
  State<EmergencyRequestPage> createState() => _EmergencyRequestPageState();
}

class _EmergencyRequestPageState extends State<EmergencyRequestPage> {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Emergency Type",
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Steps 1/2",
                    style: textTheme(context).titleLarge?.copyWith(
                          color: colorScheme(context).primary,
                        ),
                  ),
                ),
              ],
            ),
            EmergencySelectionWidget()
          ],
        ),
      ),
    );
  }
}


