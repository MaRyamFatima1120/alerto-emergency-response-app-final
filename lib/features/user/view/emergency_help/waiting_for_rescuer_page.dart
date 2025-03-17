import 'package:flutter/material.dart';

import '../../../../core/utils/global_variable.dart';

class WaitingForRescuerPage extends StatefulWidget {
  const WaitingForRescuerPage({super.key});

  @override
  State<WaitingForRescuerPage> createState() => _WaitingForRescuerPageState();
}

class _WaitingForRescuerPageState extends State<WaitingForRescuerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Countdown Progress

            // Circular Countdown Progress
            /*  SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: countdown / 30, // Updates progress dynamically
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.grey[300],
                  ),
                  Center(
                    child: Text(
                      "$countdown sec",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),*/

            Text("""Your request will be sent to 
the nearest rescuer.""",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500)),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
