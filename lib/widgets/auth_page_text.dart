import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  const SmallText({
required this.text,
    super.key, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size,
          color:const Color(0xff67727d)),
    );
  }
}
