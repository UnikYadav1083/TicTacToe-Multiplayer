import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   final List<Shadow> shadow;
   final String text;
   final double fontSize;
  const CustomText({Key? key, required this.shadow, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      style: TextStyle(
        fontSize: fontSize,
        shadows: shadow,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
