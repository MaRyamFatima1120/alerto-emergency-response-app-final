import 'package:alerto_emergency_response_app/core/utils/snackbar_helper.dart';
import 'package:alerto_emergency_response_app/features/user/provider/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_icon.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../widgets/emergency_card_widget.dart';
import '../../../../widgets/rounded_button.dart';
import '../../provider/google_sign_in_provider.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    final selectedRole = Provider.of<RoleProvider>(context).selectedRole;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
        children: [
          Center(
            child: Text(
              "Who are you?",
              style: textTheme(context).headlineLarge,
            ),
          ),
          Text(
            "Tell us if you're a victim or an rescuer to customize your journey.",
            style: textTheme(context)
                .bodyLarge
                ?.copyWith(color: colorScheme(context).onSurface),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          CustomEmergency(
            color: selectedRole == "Victim"
                ? colorScheme(context).primary
                : colorScheme(context).surface,
            title: "Victim",
            subtitle: "Call rescuer\nin emergency",
            svgIcon: AppIcon.emergencyIcon,
            onTap: () {
              final role = Provider.of<RoleProvider>(context, listen: false);
              role.setRole('Victim');
            },
            style: selectedRole == "Victim"
                ? textTheme(context).bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colorScheme(context).surface)
                : textTheme(context).bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
            customSubtitle: selectedRole == "Victim"
                ? textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).surface,
                    )
                : textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onSurface),
            width: 30,
            height: 30,
            radius: 30,
          ),
          SizedBox(
            height: 20,
          ),
          CustomEmergency(
            color: selectedRole == "Rescuer"
                ? colorScheme(context).primary
                : colorScheme(context).surface,
            title: "Rescuer",
            subtitle: "Offer your services\n as a rescue",
            svgIcon: AppIcon.trackIcon,
            onTap: () {
              final role = Provider.of<RoleProvider>(context, listen: false);
              role.setRole('Rescuer');
            },
            style: selectedRole == "Rescuer"
                ? textTheme(context).bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colorScheme(context).surface)
                : textTheme(context).bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
            customSubtitle: selectedRole == "Rescuer"
                ? textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).surface,
                    )
                : textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onSurface),
            width: 30,
            height: 30,
            radius: 30,
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
            pressed: () {},
            height: 60,
            color: colorScheme(context).primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.,
              children: [
                SvgPicture.asset(
                  AppIcon.callIcon,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                Text(
                  "Continue With Phone",
                  style: textTheme(context).bodyMedium?.copyWith(
                        color: colorScheme(context).surface,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              pressed: () {
                final role = Provider.of<RoleProvider>(context, listen: false)
                    .selectedRole;

                if (role == null) {
                  CustomSnackBar.show(context,
                      message: "Please select a role first.");
                  return;
                }
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin(context, role: role);
              },
              color: colorScheme(context).primary,
              bgColor: colorScheme(context).surface,
              height: 60,
              child: Consumer<GoogleSignInProvider>(
                builder: (BuildContext context, provider, Widget? child) {
                  return provider.isLoading
                      ? Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: colorScheme(context).primary,
                              strokeWidth: 3,
                              // value: 20,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              AppIcon.googleIcon,
                              width: 20,
                              height: 20,
                              //  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            Text(
                              "Continue With Google",
                              style: textTheme(context).bodyMedium?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        );
                },
              )),
        ],
      ),
    );
  }
}
