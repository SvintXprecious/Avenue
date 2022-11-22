import 'package:avenue/config/config.dart';
import 'package:flutter/material.dart';

import '../../util/dimensions.dart';

class AvenueAppBar extends StatelessWidget {
  const AvenueAppBar({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
    this.background=AvenueColors.backgroundColor,}) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final Color background;


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return AppBar(
      leading:Padding(
        padding: EdgeInsets.only(left: dimensions.horizontalPadding20,top: dimensions.verticalPadding10),
        child: leading,) ,


      title:Padding(
        padding: EdgeInsets.only(top: dimensions.verticalPadding10),
        child: title,
      ),

      actions: [
        Padding(
          padding:  EdgeInsets.only(right: dimensions.horizontalPadding20,top: dimensions.verticalPadding10),
          child: trailing,
        )
      ],
      elevation: 0,
      centerTitle: true,
      backgroundColor: AvenueColors.backgroundColor,
      toolbarHeight: dimensions.toolbarHeight40,
    );
  }
}
