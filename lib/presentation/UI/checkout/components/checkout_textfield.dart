import 'package:flutter/material.dart';
import 'package:avenue/presentation/widgets/widgets.dart';

import '../../../../util/dimensions.dart';

class CheckoutTextField extends StatelessWidget {
  CheckoutTextField({Key? key, required this.label, required this.child,}) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: dimensions.horizontalPadding12),
          child: Typographic(text: label,size: dimensions.font14,),
        ),

        SizedBox(height: dimensions.sizedBox20,),
        child,
        SizedBox(height: dimensions.sizedBox40,),
      ],
    );
  }
}
