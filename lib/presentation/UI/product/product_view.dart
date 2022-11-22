import 'package:avenue/config/config.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:avenue/util/number_format.dart';
import 'package:flutter/material.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';

import '../../../util/dimensions.dart';

class  ProductDetailsView extends StatelessWidget {
  const  ProductDetailsView({Key? key,required this.product}) : super(key: key);
  final Product product;



  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 500),
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left:0,
                right:0,
                child: FadeInUp(
                  delay:const Duration(milliseconds: 400,),
                  duration: const Duration(milliseconds: 1000),
                  child: InkWell(
                    onTap: (){Navigator.pushNamed(context, '/photoview',arguments: product);},
                    child: Container(
                      width: double.maxFinite,
                      height: dimensions.containerHeight400,
                      decoration:  BoxDecoration(
                        image:DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit:BoxFit.cover,
                        ),

                      ),
                    ),
                  ),
                ),),

            Positioned(
              top: dimensions.positionedHeight60,
              left: dimensions.positionedWidth25,
              right: dimensions.positionedWidth25,
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: const AvenueIcon(
                        icon: Iconsax.arrow_left_1,
                        size: 26,
                        color: AvenueColors.iconBackgroundColorBlueAccent,),),

                  BlocBuilder<CartBloc,CartState>(
                    builder: (context,state){
                      if(state is CartLoaded){
                        Map cart = state.cart.productQuantity(state.cart.products);
                        if (cart.isEmpty){
                          return IconButton(
                            onPressed: (){Navigator.pushNamed(context, "/cart");},
                            icon: const AvenueIcon(
                              icon: Iconsax.shopping_bag,
                              size: 26,
                              color: AvenueColors.iconBackgroundColorBlueAccent,),);


                        }
                        return Badge(
                          badgeContent: Typographic(
                            text: cart.length.toString(),
                            size: 12,
                            fontWeight: FontWeight.normal,
                            color: AvenueColors.backgroundColor,),
                          badgeColor: Colors.red,
                          position: BadgePosition.topEnd(top: dimensions.verticalPadding1,end:dimensions.horizontalPadding6),
                          child:IconButton(
                            onPressed: (){Navigator.pushNamed(context, "/cart");},
                            icon: const AvenueIcon(
                              icon: Iconsax.shopping_bag,
                              size: 26,
                              color: AvenueColors.iconBackgroundColorBlueAccent,),) ,

                        );
                      }
                      else{
                        return const Text("Nothing");
                      }


                    },),


            ],),
              ),),
            Positioned(
              top: dimensions.positionedHeight350,
              bottom: 0,
              width: MediaQuery.of(context).size.width,
                child:Container(
                  padding: EdgeInsets.only(
                      left: dimensions.horizontalPadding20,
                      right: dimensions.horizontalPadding20,
                      top: dimensions.verticalPadding20,
                      bottom: dimensions.verticalPadding20,),

                  decoration: const BoxDecoration(
                    color: AvenueColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Typographic(
                          text: product.seller.toUpperCase(),
                          fontWeight: FontWeight.normal,size: dimensions.font14,
                          color: AvenueColors.typographyWhiteBlue,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           FadeInLeft(
                               delay:const Duration(milliseconds: 400,),
                               duration: const Duration(milliseconds: 1000),
                               child: Typographic(
                                 text: product.name,
                                 color: AvenueColors.typographyBlueAccent,
                                 size: dimensions.font16,),),

                           FadeInLeft(
                             delay:const Duration(milliseconds: 400,),
                             duration: const Duration(milliseconds: 1000),
                             child: Typographic(
                               text: "MWK ${decimalPattern.format(product.price)}",
                               color: AvenueColors.typographyBlueAccent,size: dimensions.font16,),
                           )
                         ],
                       ),
                        SizedBox(height: dimensions.sizedBox20,),
                        Typographic(text: "Description",size: dimensions.font16,),
                        SizedBox(height: dimensions.sizedBox10,),
                        FadeInUp(
                          delay:const Duration(milliseconds: 400,),
                          duration: const Duration(milliseconds: 1000),
                          child: Typographic(
                            maxLines:null,
                            overFlow:null,
                            text: product.description!,
                            size: dimensions.font14,
                            color: AvenueColors.typographyWhiteBlue,
                            fontWeight: FontWeight.normal,
                            textHeight: 2,),
                        ),


                      ],
                    ),
                  ),

                ),
            ),

          ],
        ),
      ),
    );

  }
}
