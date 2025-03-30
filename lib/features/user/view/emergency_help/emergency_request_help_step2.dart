import 'package:alerto_emergency_response_app/core/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/go_routes.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../core/utils/validation.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class EmergencyRequestHelpStep2 extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String emergencyType;
  final String emergencyIcon;

  const EmergencyRequestHelpStep2(
      {super.key,
      required this.emergencyType,
      required this.latitude,
      required this.longitude, required this.emergencyIcon});



  @override
  State<EmergencyRequestHelpStep2> createState() =>
      _EmergencyRequestHelpStep2State();
}

class _EmergencyRequestHelpStep2State extends State<EmergencyRequestHelpStep2> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final notesController = TextEditingController();


  void saveEmergencyRequest() async {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Generate a unique request ID
      String requestId = Uuid().v4();

      // Get the user details
      String phone = phoneController.text;
      //String name = "Maryam"; // You can get this dynamically if needed

      // New emergency request data
      Map<String, dynamic> newRequest = {
        "latitude": widget.latitude,
        "longitude": widget.longitude,
        "emergencyType": widget.emergencyType,
        'emergencyIcon':widget.emergencyIcon,
        "notes": notesController.text,
        "timestamp": FieldValue.serverTimestamp(),
      };

      // Reference to the user's document
      DocumentReference userDoc = firestore.collection("emergency_requests")
          .doc(phone);

      try {
        // Update user data and add new request inside "requests"
        await userDoc.set({
          /* "name": name,*/
          "phone": phone,
        }, SetOptions(merge: true)); // Merge to avoid overwriting existing data

        await userDoc.update({
          "requests.$requestId": newRequest, // Store request under "requests"
        }).then((_) async {
          //print("Emergency Request Saved Successfully!");

          await Future.delayed(Duration(seconds: 1));
          if(!mounted) return;
          context.pushNamed(AppRoute.userMapPage, extra: {
            'phone': phone
          });
        }
        );
      }
      catch (error) {
      //  print("Error saving request: $error");
        if(!mounted) return;
        CustomSnackBar.show(context, message: "Failed to submit emergency request",);
      }
    }
  }


    @override
    void dispose() {
      phoneController.dispose();
      notesController.dispose();
      // TODO: implement dispose
      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.emergencyType,
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Additional",
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Steps 2/2",
                        style: textTheme(context).titleLarge?.copyWith(
                          color: colorScheme(context).primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                      text: 'Phone Number',
                      style: textTheme(context).bodyMedium,
                      children: [
                        TextSpan(
                          text: '*',
                          style: textTheme(context).titleSmall,
                        )
                      ]),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "03306821495",
                  keyboard: TextInputType.phone,
                  controller: phoneController,
                  validator: phoneValidate,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Additional Notes ", style: textTheme(context).bodyMedium),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "It is important...",
                  keyboard: TextInputType.text,
                  controller: notesController,
                  maxLine: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  pressed: () {
                    saveEmergencyRequest();
                  },
                  width: double.infinity,
                  height: 60,
                  bgColor: colorScheme(context).primary,
                  child: Text("Submit", style: textTheme(context).labelLarge),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

