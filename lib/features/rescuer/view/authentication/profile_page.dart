import 'package:flutter/material.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
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
              //validator: validateEmail,
            ),
            SizedBox(height: 20),
            Text(
              "Phone Number",
              style: textTheme(context).bodyMedium,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "077632455656",
              keyboard: TextInputType.text,
              //validator: validatePassword,
            ),
            SizedBox(height: 20),
            Text(
              "Location",
              style: textTheme(context).bodyMedium,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "GPS",
              keyboard: TextInputType.text,
              //validator: validatePassword,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.6),
                  )),
            ),
            SizedBox(height: 15),
            CustomButton(
              pressed: () {},
              width: double.infinity,
              height: 60,
              bgColor: colorScheme(context).primary,
              child:
                  Text("Create Account", style: textTheme(context).labelLarge),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
