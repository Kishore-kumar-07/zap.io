import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class TopEventsComponent extends StatelessWidget {
  const TopEventsComponent({super.key, required this.num, required this.idx});
  final int num;
  final int idx;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: idx,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            height: 280,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(image: AssetImage("assets/images/aadhina.jpg"),fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(color: Colors.black,blurRadius: 8,spreadRadius: 0.2,blurStyle: BlurStyle.outer)
              ]
            ),
          ),
        ),
        Positioned(
          left: 5,
          bottom: -50,
          child: StrokeText(
            text: num.toString(),
            textStyle: GoogleFonts.bebasNeue(fontSize: 150,color: Colors.black.withOpacity(0.7)),
            strokeColor: Colors.green,
            strokeWidth: 3,
          ),
        )
      ],
    );
  }
}
