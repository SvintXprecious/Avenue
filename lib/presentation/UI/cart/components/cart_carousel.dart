
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../util/dimensions.dart';
import 'cart_product_card.dart';


class CartCarousel extends StatelessWidget {
  CartCarousel({Key? key,required this.cart}) : super(key: key);
  Map<dynamic,dynamic> cart;


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return FadeInUp(
      delay:const Duration(milliseconds: 400,),
      duration: const Duration(milliseconds: 1000),
      child: Container(
        margin: EdgeInsets.only(left: dimensions.horizontalPadding20,right: dimensions.horizontalPadding20),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: cart.keys.length,
            itemBuilder: (context,index){
              return CartProductCard(
                product: cart.keys.elementAt(index),
                quantity: cart.values.elementAt(index),
              );
              },

        ),
      ),
    );
  }
}
