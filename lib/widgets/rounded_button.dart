import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback pressed;
  final Color? bgColor;
  final TextStyle? style;
  final double? width ;
  final double? height;
  const CustomButton({super.key, this.text, required this.pressed,this.bgColor,this.style,this.height=50.0,this.width=150,this.child, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: Size(width!,height!),
          elevation: 0.0,
      ),
      child:child,
    );
  }
}