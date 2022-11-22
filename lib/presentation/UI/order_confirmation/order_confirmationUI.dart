import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';

import '../../../util/dimensions.dart';
import 'order_confirmation_body_view.dart';

class OrderConfirmationUI extends StatelessWidget {
  const OrderConfirmationUI({Key? key}) : super(key: key);

  static const String routeName='/order_confirmation';

  static Route route(){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmationUI(),);
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10,),
          child: Typographic(text: "Order Confirmation",size: 18,),

        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: dimensions.toolbarHeight65,
        backgroundColor: AvenueColors.backgroundColorLightGray,


      ),
      body: const OrderConfirmationBodyView(),
      bottomNavigationBar: BounceInLeft(
        delay: const Duration(milliseconds: 1300),
        duration: const Duration(milliseconds: 800),
        child: Container(
            padding: EdgeInsets.only(
                bottom: dimensions.verticalPadding60,
                left: dimensions.horizontalPadding20,
                right: dimensions.horizontalPadding20,),
            height: dimensions.containerHeight110,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: OutlinedButton.icon(
                onPressed: (){Navigator.pushNamed(context, '/');},

                icon: const AvenueIcon(
                  icon: Iconsax.discover,
                  color: AvenueColors.iconBackgroundColorBlueAccent,
                  size: 24,),
                label: Typographic(
                  text:"Explore more items",
                  color: AvenueColors.typographyBlueAccent,
                  size: 16,),

              style:OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                  side: const BorderSide(color: AvenueColors.borderOutlineBlueAccent),
              ) ,),
          ),
      ),

    );
  }
}
