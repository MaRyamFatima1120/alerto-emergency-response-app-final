import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;

  //constructor with named parameter
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.keyboard,
      this.hintText,
      this.obscureText = false,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10.0),
      // shadowColor: colorScheme(context).onSurface.withValues(alpha: 2),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        validator: validator,
        obscureText: obscureText,
        //cursorHeight: 30,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textTheme(context)
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.normal,color: colorScheme(context).onSurface.withValues(alpha: 0.6)),
            suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,),
                child: suffixIcon),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0)),
      ),
    );
  }
}
