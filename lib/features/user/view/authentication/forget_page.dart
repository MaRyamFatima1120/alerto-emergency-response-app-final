import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.pushNamed('/login');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Forgot Password",
                style: textTheme(context).headlineLarge,
              ),
            ),
            Center(
              child: Text(
                """Enter your email address to
reset your password""",
                style: textTheme(context).bodyLarge?.copyWith(
                      color: AppColor.greyColor,
                    ),
                textAlign: TextAlign.center,
              ),
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
            CustomButton(
              pressed: () {},
              width: double.infinity,
              height: 60,
              bgColor: colorScheme(context).primary,
              child:
                  Text("Send Reset Link", style: textTheme(context).labelLarge),
            ),
            SizedBox(height: 15),
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Remember password? Back to  ",
                  style: textTheme(context).bodyMedium?.copyWith(
                      fontSize: 14,
                      color: colorScheme(context)
                          .surface
                          .withValues(alpha: 0.6)),
                ),
                TextSpan(
                    text: "Login",
                    style: textTheme(context).bodyMedium?.copyWith(
                        fontSize: 14,
                        color: colorScheme(context)
                            .primary
                            .withValues(alpha: 0.6),),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push("/login");
                      }),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
