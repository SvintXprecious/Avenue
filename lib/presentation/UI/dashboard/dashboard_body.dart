import 'package:avenue/presentation/UI/dashboard/components/order_carousel.dart';
import 'package:flutter/material.dart';

import '../../../util/dimensions.dart';

class DashboardBodyView extends StatelessWidget {
  const DashboardBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Container(
      padding: EdgeInsets.only(left:dimensions.horizontalPadding20,right: dimensions.horizontalPadding20 ),
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index) => const OrderCarousel(),
      ),
    );
  }
}
