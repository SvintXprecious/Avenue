import 'package:avenue/config/config.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:avenue/presentation/UI/checkout/checkout_body.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/dimensions.dart';

class CheckoutUI extends StatelessWidget {
  static const String routeName='/checkout';

  static Route route(){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (context) => const CheckoutUI(),);
  }
  const CheckoutUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Scaffold(
      backgroundColor: AvenueColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
              left: dimensions.horizontalPadding20,
              top: dimensions.verticalPadding10,),
          child: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon:const AvenueIcon(
                icon:Iconsax.arrow_left_1,
                size: 26,
                color: AvenueColors.iconForegroundColorBlack,),),
        ),

        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: Typographic(text: "Checkout",size: dimensions.font18,),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        automaticallyImplyLeading: true,
        toolbarHeight: dimensions.toolbarHeight65,
      ),
      body: const CheckoutBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: dimensions.horizontalPadding30,
          right: dimensions.horizontalPadding30,
          bottom: dimensions.verticalPadding30,),
        height: dimensions.containerHeight80,
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
    builder: (context, state) {

      if(state is  CheckoutLoaded){
        //var validation=(state.city!=null) && (state.country!=null) && (state.address!=null) && (state.fullName!=null);

      return ElevatedButton.icon(
        onPressed: (){
          context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));

          Navigator.pushNamed(context, '/order_confirmation');},
          icon: const AvenueIcon(icon: Iconsax.shopping_bag4,),
          label: Typographic(
            text: "Order Now",
            size: dimensions.font16,
            color: AvenueColors.typographyWhite,),
        style:ElevatedButton.styleFrom(
            primary:AvenueColors.backgroundColorBlueAccent,
            shape: const StadiumBorder(),
          ) ,);}
      else{
        return const Text("");
    }



    },),),);}

  }