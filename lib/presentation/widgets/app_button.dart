import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TypographicButton extends StatelessWidget {
   TypographicButton({
    Key? key,
    required this.child,
    required this.onTap,
    required this.width,
    required this.height,
    this.color=AvenueColors.backgroundColorBlueAccent,}) : super(key: key);

  final Color color;
  final Widget child;
  final double height;
  final double width;
  void  onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap;},
      child: Container(
        height:height ,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(child:child),
      ),
    );
  }
}
