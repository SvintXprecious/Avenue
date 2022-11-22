import 'package:avenue/presentation/UI/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:avenue/logic/blocs/bloc.dart';

import '../../../util/dimensions.dart';

class ProductDetailsUi extends StatelessWidget {
  static const String routeName='/product';

  static Route route({required Product product}){
    return MaterialPageRoute(
        settings:const RouteSettings(name: routeName),
        builder: (context) => ProductDetailsUi(product: product,),);
  }

  const ProductDetailsUi({Key? key,required this.product}) : super(key: key);
  final Product product;


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return  Scaffold(
      body:ProductDetailsView(product: product,),
      bottomNavigationBar: Container(
        color: AvenueColors.backgroundColor,
        padding: EdgeInsets.only(
            left:dimensions.horizontalPadding30,
            right:dimensions.horizontalPadding20,
            bottom: dimensions.verticalPadding30,),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                if (state is WishlistLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is WishlistLoaded) {
                  return  InkWell(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to your Wishlist!'),
                      ),
                    );
                    context
                        .read<WishlistBloc>()
                        .add(AddProductToWishlist(product));
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AvenueColors.borderOutlineBlackColor),),
                      child: const Center(
                          child: AvenueIcon(
                            icon: Iconsax.archive_add,
                            color: AvenueColors.backgroundColorBlueAccent,),
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),

            BlocBuilder<CartBloc,CartState>(
               builder: (context,state){
                 if(state is CartLoading){
                   return const CircularProgressIndicator();
                 }

                 if(state is CartLoaded){
                   return FadeInRight(
                     duration: const Duration(milliseconds: 1000),
                     delay: const Duration(milliseconds: 400),
                     child:Container(
                       height: dimensions.containerHeight50,
                       width: dimensions.containerWidth180,
                       child: ElevatedButton.icon(
                         onPressed: (){
                           context.read<CartBloc>().add(AddProduct(product));},
                         icon: const AvenueIcon(icon: Iconsax.shopping_bag4,),
                         label: Typographic(text: "Add to Bag",size: dimensions.font16,color: AvenueColors.typographyWhite,),
                         style:ElevatedButton.styleFrom(
                           primary:AvenueColors.backgroundColorBlueAccent,
                           shape: const StadiumBorder(),
                         ) ,),
                     ),
                   );


                 }
                 return const Text('Something went wrong!');
               },
               Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: dimension.horizontalPadding20,
                      right: dimension.horizontalPadding20,
                      bottom: dimension.verticalPadding30),
                  padding: EdgeInsets.only(
                      top: dimension.verticalPadding10,
                      bottom: dimension.verticalPadding10),
                  decoration: BoxDecoration(
                      color: StudlyColors.backgroundColorBlueAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: StudlyTypography(
                    text: 'Check-in',
                  )),
                )

             ),

          ],
        ),
      ),

    );
  }
}
