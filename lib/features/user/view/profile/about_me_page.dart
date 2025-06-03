import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_image.dart';

class AboutAlertoPage extends StatefulWidget {
  const AboutAlertoPage({super.key});

  @override
  State<AboutAlertoPage> createState() => _AboutAlertoPageState();
}

class _AboutAlertoPageState extends State<AboutAlertoPage> {

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
                child: Image.asset(
                  isDarkMode ? AppImage.darkLogo : AppImage.lightLogo,
                  filterQuality: FilterQuality.high,
                  width: 200,
                  height: 170,
                ),
              ),
              // Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statColumn("Users Helped", "100+"),
                  SizedBox(width: 10,),
                  _statColumn("Verified Rescuers", "25"),
                ],
              ),

              const SizedBox(height: 30),
              _sectionTitle(
                  "Our Mission:"
              ),
              _paragraph(
                context,"At Alerto, our mission is to make safety accessible to everyone — anytime, anywhere. We believe that no call for help should go unanswered. That’s why we use technology not just to inform, but to act — connecting people faster, smarter, and more securely."
              ),
              const SizedBox(height: 30),
              _sectionTitle(
                  "About the Developer:"
              ),
              _paragraph(
                  context,"Hi, I’m Maryam Fatima, a passionate Flutter developer currently in my final year of studies. Alerto is more than just a project — it’s a vision. My goal is to combine mobile technology with real-world impact to create tools that can genuinely save lives. With every line of code, I'm committed to building a safer tomorrow."
              ),
              SizedBox(height: 10,),
              Center(child: Text("\"Together, We Respond. Together, We Save Lives.\"",style: textTheme(context).headlineLarge?.copyWith(fontSize: 18))),
              const SizedBox(height: 10),
              Center(child: Text("©CopyRight By Maryam Fatima",style: textTheme(context).bodyMedium?.copyWith(color: colorScheme(context).primary,),textAlign: TextAlign.center,))



            ],
          ),
        ),
      ),
    );
  }

  Widget _statColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: textTheme(context).headlineLarge?.copyWith(color: colorScheme(context).primary),),
        Text(label, style: textTheme(context).bodyMedium),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme(context).headlineLarge,
        ),
        Divider(
          endIndent: 200,
          thickness: 5,
          color: colorScheme(context).primary,),
      ],
    );
  }

  Widget _paragraph(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: textTheme(context).bodyMedium?.copyWith(height: 1.5),
    );
  }

}
