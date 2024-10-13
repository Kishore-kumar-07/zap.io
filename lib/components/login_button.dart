import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  AnimatedGradientBorder(
      gradientColors: [
        Colors.purple.shade100,
        Colors.blue.shade100,
        Colors.red.shade100,
      ],
      borderSize: 2,
      glowSize: 5,
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
