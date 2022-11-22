import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../../util/dimensions.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmationBodyView extends StatelessWidget {
  const OrderConfirmationBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Container(
      padding: EdgeInsets.only(
          left: dimensions.horizontalPadding20,
          right: dimensions.horizontalPadding20,
          top: dimensions.verticalPadding10,),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
            child:FadeInDown(
              child:Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_ldtbwmle.json",
              repeat: false,),),),


          Positioned(
            top: dimensions.positionedHeight320,left: dimensions.horizontalPadding20,
          child: FadeInUp( delay: const Duration(milliseconds: 1200),
            duration: const Duration(milliseconds: 800),
            child:Typographic(text: "Your order is confirmed!"),),),




          Positioned(
          top: dimensions.positionedHeight370,
          left: dimensions.horizontalPadding30,
          child: FadeInUp(
            delay: const Duration(milliseconds: 1300),
            duration: const Duration(milliseconds: 800),
            child: Typographic(
              text: "Thank you for purchasing with Avenue.",
              size: dimensions.font14,color: AvenueColors.typographyGrey,),
          ),)
        ],
      ),


    );
  }
}
