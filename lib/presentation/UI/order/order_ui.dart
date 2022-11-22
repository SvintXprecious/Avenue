import 'package:avenue/logic/models/models.dart';
import 'package:flutter/material.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/config/config.dart';

import '../../../util/dimensions.dart';

class OrderUI extends StatelessWidget {
  OrderUI({Key? key, required this.checkout}) : super(key: key);

  static const String routeName='/order';
  final Checkout checkout;

  static Route route(Checkout checkout){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (context) =>OrderUI(checkout: checkout,),);
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
          padding: EdgeInsets.only(left: dimensions.horizontalPadding10,top: dimensions.verticalPadding10),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const AvenueIcon(
              icon: Iconsax.arrow_left_1,
              size:24,
              color: AvenueColors.iconForegroundColorBlack,),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: Typographic(text: "Order",size: dimensions.font18,),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        automaticallyImplyLeading:true,
        toolbarHeight: dimensions.toolbarHeight65,
      ),
      body: Column(
        children: [
          Typographic(text: "Address"),
        ],
      ),
    );
  }
}
