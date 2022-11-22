import 'package:avenue/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typographic extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow? overFlow;
  FontWeight fontWeight;
  double textHeight;
  int? maxLines;

  Typographic({Key? key,
    required this.text,
    this.color=AvenueColors.typographyDefaultColor,
    this.size=22,
    this.overFlow=TextOverflow.ellipsis,
    this.fontWeight=FontWeight.w500,
    this.textHeight=1.5,
  this.maxLines=1,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: maxLines,
        overflow: overFlow,
        style:GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: color,
                fontWeight: fontWeight,
                fontSize: size,
                height:textHeight,
            ),
        ),

    );

  }
}
