import 'package:alerto_emergency_response_app/core/constants/app_color.dart';
import 'package:alerto_emergency_response_app/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/rounded_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            Column(
              children: [
                Text(
                  "Create Your Account",
                  style: textTheme(context).headlineLarge,
                ),
                Text(
                  "This handy tool helps you create dummy text for all your layout needs.",
                  style: textTheme(context).bodyLarge?.copyWith(
                        color: AppColor.greyColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text("Email", style: textTheme(context).bodyMedium),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "abc@gmail.com",
              keyboard: TextInputType.emailAddress,
              //validator: validateEmail,
            ),
            SizedBox(height: 20),
            Text(
              "Create Password",
              style: textTheme(context).bodyMedium,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "************",
              keyboard: TextInputType.text,
              //validator: validatePassword,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off,
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.6),
                  )),
            ),
            SizedBox(height: 20),
            Text(
              "Confirm Password",
              style: textTheme(context).bodyMedium,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "************",
              keyboard: TextInputType.text,
              //validator: validatePassword,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off,
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.6),
                  )),
            ),
            SizedBox(height: 15),
            CustomButton(
              pressed: () {
                context.go("/profile");
              },
              width: double.infinity,
              height: 60,
              bgColor: colorScheme(context).primary,
              child: Text("Next", style: textTheme(context).labelLarge),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.2),
                    thickness: 1,
                    endIndent: 10,
                    indent: 15,
                  ),
                ),
                Text(
                  "or",
                  style: textTheme(context).bodyMedium?.copyWith(
                      fontSize: 14,
                      color: colorScheme(context)
                          .onSurface
                          .withValues(alpha: 0.6)),
                ),
                Expanded(
                  child: Divider(
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.2),
                    thickness: 1,
                    indent: 10,
                    endIndent: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: colorScheme(context).surface,
                    backgroundImage: AssetImage(AppImage.googleImage),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: colorScheme(context).surface,
                    backgroundImage: AssetImage(AppImage.facebookImage),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: colorScheme(context).surface,
                    backgroundImage: AssetImage(AppImage.appleImage),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Already have an account?",
                style: textTheme(context).bodyMedium?.copyWith(
                    fontSize: 14,
                    color:
                        colorScheme(context).onSurface.withValues(alpha: 0.6)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.pushReplacement("/first");
                },
                child: Text(
                  "Login",
                  style: textTheme(context).bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme(context).onSecondary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
