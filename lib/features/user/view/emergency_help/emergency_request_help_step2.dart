import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../core/utils/validation.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';

class EmergencyRequestHelpStep2 extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String emergencyType;

  const EmergencyRequestHelpStep2(
      {super.key,
      required this.emergencyType,
      required this.latitude,
      required this.longitude});



  @override
  State<EmergencyRequestHelpStep2> createState() =>
      _EmergencyRequestHelpStep2State();
}

class _EmergencyRequestHelpStep2State extends State<EmergencyRequestHelpStep2> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final notesController = TextEditingController();


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
                  if (_formKey.currentState!.validate()) {
                    context.push(
                      "/userMap-page",
                      extra: {
                        'latitude': widget.latitude,
                        'longitude': widget.longitude,
                        'selectedEmergency': widget.emergencyType,
                        'phone': phoneController.text,
                        'notes': notesController.text,
                      },
                    );
                  }
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
