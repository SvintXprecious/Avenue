import 'package:avenue/config/config.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:avenue/presentation/UI/cart/components/empty_cart.dart';
import 'package:avenue/presentation/UI/cart/components/bag_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../util/dimensions.dart';
import 'components/cart_carousel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/presentation/widgets/widgets.dart';


class CartBodyView extends StatelessWidget {
  const CartBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Container(
      height: double.maxFinite,
      color: AvenueColors.backgroundColor,
      padding: EdgeInsets.only(top: dimensions.verticalPadding20,bottom: dimensions.verticalPadding20),
      child: SingleChildScrollView(
        child: BlocBuilder<CartBloc,CartState>(
            builder: (context,state){
              if(state is CartLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is CartLoaded){
                Map cart = state.cart.productQuantity(state.cart.products);
                if (cart.isEmpty){
                  return const EmptyBag();
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CartCarousel(cart: cart,),
                      SizedBox(height: dimensions.sizedBox40,),
                      const BagSummary(),

                    ],
                  ),
                );
              }
              else{
                return const Text("Nothing");
              }


            },),
      ),
    );
  }
}
