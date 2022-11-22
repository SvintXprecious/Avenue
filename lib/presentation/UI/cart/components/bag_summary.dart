import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:avenue/util/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avenue/logic/blocs/bloc.dart';

import 'package:avenue/util/util.dart';

class BagSummary extends StatelessWidget {
  const BagSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AvenueColors.backgroundColor,
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {

      if (state is CartLoaded) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Typographic(text: "Bag Summary",size: dimensions.font18,),
            const Divider(color:Colors.grey ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Typographic(
                  text: "Subtotal",
                  size: dimensions.font15,
                  fontWeight: FontWeight.normal,
                  color: AvenueColors.typographyGrey,),
                Typographic(
                  text: "MWK ${decimalPattern.format(int.parse(state.cart.subtotalString))}.00",
                  size: dimensions.font14,
                  color: AvenueColors.typographyGrey,)
              ],
            ),
            SizedBox(height: dimensions.sizedBox10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Typographic(
                  text: "Delivery fee",
                  size: dimensions.font14,
                  fontWeight: FontWeight.normal,
                  color: AvenueColors.typographyGrey,),
                Typographic(
                  text: "MWK ${state.cart.deliveryFeeString}",
                  size: dimensions.font15,
                  color: AvenueColors.typographyGrey,)
              ],
            ),
            SizedBox(height: dimensions.sizedBox10,),
            const Divider(color: Colors.grey),
            SizedBox(height: dimensions.sizedBox10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Typographic(
                  text: "Total",
                  size: dimensions.font16,
                  fontWeight: FontWeight.w500,
                  color: AvenueColors.typographyBlueAccent,),
                Typographic(text: "MWK ${decimalPattern.format(int.parse(state.cart.totalString))}.00",size: dimensions.font17,color: AvenueColors.typographyBlueAccent,)
              ],
            ),

          ],
        );
      }
      else{
        return const Text("data");
    }
        },),

    );
  }
}
