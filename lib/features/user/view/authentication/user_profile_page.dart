import 'package:alerto_emergency_response_app/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';
import '../../provider/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, String> data;

  const ProfilePage({super.key, required this.data});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = widget.data['email'];
    final password = widget.data['password'];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  isDarkMode ? AppImage.darkLogo : AppImage.lightLogo,
                  filterQuality: FilterQuality.high,
                  width: 200,
                  height: 120,
                ),
              ),
              Center(
                child: Text(
                  "Personal Information",
                  style: textTheme(context).headlineLarge,
                ),
              ),
              SizedBox(height: 30),
              Text("Full Name", style: textTheme(context).bodyMedium),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "i.e:Maryam",
                keyboard: TextInputType.emailAddress,
                validator: validateUsername,
                controller: nameController,
              ),
              SizedBox(height: 20),
              Text(
                "Phone Number",
                style: textTheme(context).bodyMedium,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "i.e 03306821495",
                keyboard: TextInputType.text,
                validator: phoneValidate,
                controller: phoneController,
              ),
              SizedBox(height: 20),
              SizedBox(height: 15),
              CustomButton(
                pressed: () {
                  if (form.currentState!.validate()) {
                    final authProvider = context.read<AuthProvider>();
                    authProvider.handlerSignup(
                      context,
                      email!,
                      password!,
                      nameController.text, // Pass full name
                      phoneController.text, // Pass phone number
                    );
                  }
                },
                width: double.infinity,
                height: 60,
                bgColor: colorScheme(context).primary,
                child: Text("Create Account",
                    style: textTheme(context).labelLarge),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
