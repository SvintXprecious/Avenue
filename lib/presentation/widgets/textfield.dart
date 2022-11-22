import 'package:avenue/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvenueTextField extends StatelessWidget {

  AvenueTextField({
    Key? key,
    required this.onChanged,
    this.cursorColor=AvenueColors.typographyBlack,
    this.textInputAction=TextInputAction.done,
    this.textCapitalization=TextCapitalization.words,
    this.maxLines=1,
    this.fillColor=AvenueColors.backgroundColorLightGray,
    this.prefixIcon,
    this.borderRadius=50,
    this.focusedBorderRadius=50,
    this.hintText,this.contentPadding=const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
    this.focusedBorderSide=AvenueColors.backgroundColorBlueAccent,}) : super(key: key);

  void Function(String)? onChanged;
  final Color cursorColor;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final Color fillColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final double focusedBorderRadius;
  final Color focusedBorderSide;
  final String? hintText;
  final EdgeInsetsGeometry contentPadding;



  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor:  cursorColor,
      textInputAction:textInputAction,
      textCapitalization:textCapitalization,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: focusedBorderSide),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: AvenueColors.typographyGrey,
            fontSize: 16,
          ),
        ),
        contentPadding: contentPadding,
      ),
    );
  }
}
