import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final Function onPressed;
  final String title;
  final Color color;
  // ignore: prefer_typing_uninitialized_variables
  var icon;

  CustomButton({
    Key? key,
    required this.minWidth,
    required this.maxWidth,
    required this.minHeight,
    required this.onPressed,
    required this.color,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
                color: color,
                ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null ? Icon(icon, color: Colors.white) : Container(),
                icon != null ? const SizedBox(width: 10) : Container(),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            )),
          )),
    );
  }
}