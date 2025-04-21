import 'package:alerto_emergency_response_app/core/constants/app_color.dart';
import 'package:alerto_emergency_response_app/core/utils/validation.dart';
import 'package:alerto_emergency_response_app/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/rounded_button.dart';
import '../../provider/auth_provider.dart';
import '../../provider/google_sign_in_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final form = GlobalKey<FormState>();
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
              Column(
                children: [
                  Text(
                    "Welcome Back",
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
                validator: validateEmail,
                controller: emailController,
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: textTheme(context).bodyMedium,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "************",
                keyboard: TextInputType.text,
                validator: validatePassword,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      color:
                          colorScheme(context).onSurface.withValues(alpha: 0.6),
                    )),
                controller: passwordController,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: rememberPassword,
                          onChanged: (value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          }),
                      Text(
                        "Remember password",
                        style: textTheme(context).bodyMedium?.copyWith(
                            fontSize: 13,
                            color: colorScheme(context)
                                .onSurface
                                .withValues(alpha: 0.6)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          context.pushNamed("/forget");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomButton(
                pressed: () {
                  if (form.currentState!.validate()) {
                    final authProvider = context.read<AuthProvider>();
                    authProvider.handlerLogin(
                        context, emailController.text, passwordController.text
                        // Pass phone number
                        );
                  }
                },
                width: double.infinity,
                height: 60,
                bgColor: colorScheme(context).primary,
                child: Text("Log in", style: textTheme(context).labelLarge),
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
                  GestureDetector(
                    onTap: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin(context);
                    },
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
                height: 10,
              ),
              Center(
                child: Text(
                  "Don't have an account?",
                  style: textTheme(context).bodyMedium?.copyWith(
                      fontSize: 14,
                      color: colorScheme(context)
                          .onSurface
                          .withValues(alpha: 0.6)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.pushReplacement("/register");
                  },
                  child: Text(
                    "Create Account",
                    style: textTheme(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme(context).primary),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
