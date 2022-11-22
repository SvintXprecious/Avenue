
import 'package:avenue/config/colors.dart';
import 'package:avenue/presentation/UI/cart/components/quantity_controller.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/logic/blocs/bloc.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/number_format.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key,required this.product,this.quantity}) : super(key: key);
  final Product product;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product',arguments: product);
      },
      child: Container(
        margin:EdgeInsets.only(bottom:dimensions.verticalPadding5,top: dimensions.verticalPadding10),
        child: Row(
          children: [
            //image section
            Container(
              height:dimensions.containerHeight120,
              width: dimensions.containerWidth120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
              ),
            ),

            //text container
            Expanded(
              child: Container(
                height: dimensions.containerHeight120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(20),
                    bottomRight:Radius.circular(30),
                  ),

                  color: Colors.white,

                ),

                child:
                Padding(
                  padding:EdgeInsets.only(
                      left: dimensions.horizontalPadding20,
                      right: dimensions.horizontalPadding10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Typographic(
                        text: product.name,
                        size: dimensions.font16,
                        color: AvenueColors.productDetColor,),

                      SizedBox(height: dimensions.sizedBox10,),
                      Row(
                        children: [
                          Typographic(text: "Price:",size: dimensions.font14,color: AvenueColors.typographyGrey,),
                          SizedBox(width: dimensions.sizedBoxWidth5,),
                          Typographic(
                            text: "MWK ${decimalPattern.format(product.price)}",
                            size: dimensions.font16,
                            color: AvenueColors.productDetColor,),
                        ],
                      ),

                      SizedBox(height: dimensions.sizedBox10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                if(state is CartLoading){
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                                if(state is CartLoaded){
                                  return CartQuantityController(
                                    onDecrement: (){
                                    context.read<CartBloc>().add(RemoveProduct(product));

                                    },
                                    quantity: quantity,

                                    onIncrement: (){
                                      context.read<CartBloc>().add(AddProduct(product));
                                  },
                                  );

                                }
                                else {
                                  return const Text("nothing!");
                                }
                              },),

                          /**OutlineContainer(
                            wrapHeight: dimensions.containerHeight30,
                            wrapWidth: dimensions.containerWidth40,
                            child: IconButton(
                              padding: const EdgeInsets.all(2),
                              onPressed: (){context.read<CartBloc>().add(RemoveProduct(product));},
                              icon: const AvenueIcon(
                                icon: Iconsax.trash,
                                color: AvenueColors.iconForegroundColorBlack,),
                            ),
                          )*/
                        ],
                      )


                    ],


                  ),
                ),),
            )
          ],
        ),

      ),
    );
  }
}
