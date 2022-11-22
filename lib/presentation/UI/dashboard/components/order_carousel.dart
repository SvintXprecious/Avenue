import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class OrderCarousel extends StatelessWidget {
  const OrderCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Container(
      width: double.maxFinite,
      height: 250,
      padding: EdgeInsets.only(bottom:dimensions.verticalPadding20 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image:const DecorationImage(
          image: NetworkImage("ff"),
        ),
      ),
    );
  }
}
