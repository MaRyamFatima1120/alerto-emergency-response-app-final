import 'package:flutter/material.dart';
import '../../../core/utils/global_variable.dart';
import '../../../widgets/emergency_selection_widget.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emergencies",
          style: textTheme(context)
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Emergency Type",
                style: textTheme(context)
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500,fontSize: 18)),
            EmergencySelectionWidget(),
          ],
        ),
      ),
    );
  }
}
