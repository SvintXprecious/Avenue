import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/outline_container.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/dimensions.dart';

class CartQuantityController extends StatelessWidget {

  CartQuantityController({
    Key? key,
    required this.onDecrement,
    required this.onIncrement,this.quantity,}) : super(key: key);


  void Function()? onDecrement;
  void Function()? onIncrement;
  final int? quantity;


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       OutlineContainer(wrapHeight: dimensions.containerHeight30,wrapWidth: dimensions.containerWidth40,
           child:IconButton(
             padding: const EdgeInsets.all(2),
             onPressed: onDecrement,
             icon: const AvenueIcon(
               icon: Iconsax.minus,color: AvenueColors.iconForegroundColorBlack,),
           ),
       ),

        SizedBox(width: dimensions.sizedBox10,),
        Typographic(text: "$quantity",size: dimensions.font14,),
        SizedBox(width: dimensions.sizedBox10,),

        OutlineContainer(
            wrapHeight: dimensions.containerHeight30,
            wrapWidth: dimensions.containerWidth40,
            borderRadius: 20,
            child: IconButton(
              padding: const EdgeInsets.all(2),
              onPressed: onIncrement,
              icon: const AvenueIcon(icon: Iconsax.add,color: AvenueColors.iconForegroundColorBlack,),
            ),
        ),
      ],
    );
  }
}
