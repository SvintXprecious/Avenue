
import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';

import '../../../../util/dimensions.dart';
import 'package:iconsax/iconsax.dart';
class EmptyBag extends StatelessWidget {
  const EmptyBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Container(
      height: dimensions.containerHeight700,
      margin: EdgeInsets.only(left:dimensions.horizontalPadding20 ,right: dimensions.horizontalPadding20),
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network("https://assets6.lottiefiles.com/private_files/lf30_oqpbtola.json",fit: BoxFit.fill, ),

              FadeInLeft(
                delay:const Duration(milliseconds: 4100),
                duration:const Duration (milliseconds: 800),
                child: Typographic(
                  text: "I am Empty :(",
                  size: dimensions.font22,),),
              SizedBox(height: dimensions.sizedBox20,),

              FadeInLeft(
                  delay: const Duration(milliseconds: 4100),
                  duration: const Duration(milliseconds: 800),
                  child: Padding(
                    padding: EdgeInsets.only(left: dimensions.horizontalPadding60,right: dimensions.horizontalPadding60),
                    child: Typographic(
                      text: "Explore around to add items in your shopping bag",
                      color: AvenueColors.typographyWhiteBlue,maxLines: null,overFlow: null,
                      size: dimensions.font16,),
                  ),),
              SizedBox(height: dimensions.sizedBox50,),
            BounceInUp(
      delay: const Duration(milliseconds: 4100),
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

            ],
          ),
        ),
      ),
    );
  }
}
