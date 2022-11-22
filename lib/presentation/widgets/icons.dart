import 'package:flutter/material.dart';
import 'package:avenue/config/config.dart';

class AvenueIcon extends StatelessWidget {
  const AvenueIcon({Key? key,
    required this.icon,
    this.color=AvenueColors.iconForegroundColorWhite,
    this.size=20,}) : super(key: key);

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color:color ,
      size: size,

    );
  }
}
