import 'package:avenue/config/colors.dart';
import 'package:flutter/material.dart';

class OutlineContainer extends StatelessWidget {
  OutlineContainer({
    Key? key,
    required this.child,
    this.borderRadius=20,
    this.borderColor=AvenueColors.borderOutlineBlueAccent,
    this.wrapHeight=20,
    this.wrapWidth=20,
    this.backgroundColor=AvenueColors.backgroundColor,}) : super(key: key);


  final Widget child;
  final Color borderColor;
  final double borderRadius;
  final double wrapHeight;
  final double wrapWidth;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: wrapHeight,
      width: wrapWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color:borderColor,width: 1.5 ),
      ),
      child: Center(child: child),
    );
  }
}
