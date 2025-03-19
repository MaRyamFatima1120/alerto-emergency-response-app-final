import 'package:alerto_emergency_response_app/core/constants/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../core/utils/validation.dart';
import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';

class EditPersonalInfoPage extends StatefulWidget {
  const EditPersonalInfoPage({super.key});

  @override
  State<EditPersonalInfoPage> createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
  final TextEditingController fullNameController = TextEditingController(text: "abc@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "077632455656");
  final TextEditingController cnicController = TextEditingController(text: "077632455656");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Profile",
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 63,
                        backgroundColor: colorScheme(context)
                            .onSurface
                            .withValues(alpha: 0.1),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: colorScheme(context).surface,
                          backgroundImage: AssetImage(
                            AppImage.profileImage,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 100,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            AppIcon.editIcon,
                            width: 16,
                            height: 16,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Full Name",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "Maryam F.",
                  keyboard: TextInputType.text,
                  validator: validateUsername,
                  controller: fullNameController,
                ),
                SizedBox(height: 15),
                Text(
                  "Phone Number",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: "077632455656",
                  keyboard: TextInputType.phone,
                  validator: phoneValidate,
                  controller: phoneController,

                ),
                SizedBox(height: 15),
                Text(
                  "CNIC / ID Number",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: "31202-6608846-8",
                  keyboard: TextInputType.text,
                  //validator: phoneValidate,
                  controller: cnicController,
                ),
                SizedBox(height: 100),
                CustomButton(
                  pressed: () {},
                  width: double.infinity,
                  height: 60,
                  bgColor: colorScheme(context).primary,
                  child: Text("Save", style: textTheme(context).labelLarge),
                ),
              ],
            )));
  }
}
