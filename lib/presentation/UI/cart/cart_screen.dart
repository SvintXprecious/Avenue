import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/UI/cart/cart_body_view.dart';

import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';

import '../../../logic/blocs/cart/cart_bloc.dart';
import '../../../util/dimensions.dart';

class CartUI extends StatelessWidget {

  static const String routeName='/cart';

  static Route route(){
    return MaterialPageRoute(
        settings:const RouteSettings(name: routeName),
        builder: (_) => const CartUI(),);
  }
  const CartUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Scaffold(
      appBar:AppBar(
        leading:  Padding(
          padding: EdgeInsets.only(left: dimensions.horizontalPadding10,top: dimensions.horizontalPadding10),
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
          child: Typographic(text: "Shopping Bag",size: dimensions.font18,),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: dimensions.verticalPadding10,right: dimensions.horizontalPadding20),
            child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/wishlist');
                  },
                icon: const AvenueIcon(icon: Iconsax.archive_11,
                  color: AvenueColors.iconForegroundColorBlack,),),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        automaticallyImplyLeading:true,
        toolbarHeight: dimensions.toolbarHeight50,
      ),

      body: const CartBodyView(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: dimensions.horizontalPadding30,
            right: dimensions.horizontalPadding30,
            bottom: dimensions.verticalPadding30),
        height: dimensions.containerHeight80,
        width: dimensions.containerWidth250,
        child: BlocBuilder<CartBloc,CartState>(
          builder: (context,state){

            if(state is CartLoaded) {
              Map cart = state.cart.productQuantity(state.cart.products);
              if (cart.isEmpty) {
                return Container(color: AvenueColors.backgroundColor,);
              }
              else {
                return ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  icon: const AvenueIcon(icon: Iconsax.shopping_bag4,),
                  label: Typographic(text: "Checkout",
                    size: dimensions.font16,
                    color: AvenueColors.typographyWhite,),
                  style: ElevatedButton.styleFrom(
                    primary: AvenueColors.backgroundColorBlueAccent,
                    shape: const StadiumBorder(),
                  ),);

          }
          }
            else{
              return BounceInLeft(
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
              );
            }



          },),

      ),

    );
  }
}
