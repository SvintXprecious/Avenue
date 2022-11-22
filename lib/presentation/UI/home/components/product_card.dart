
import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:avenue/util/number_format.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/logic/blocs/bloc.dart';

import '../../../../util/dimensions.dart';


class RecommendedProductCard extends StatelessWidget {
  final Product product;


  const RecommendedProductCard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return InkWell(
      onTap: (){
       Navigator.pushNamed(context, '/product',arguments: product);
      },

      child: Stack(
        children: [
          Container(
            height: dimensions.containerHeight250,
            width: dimensions.containerWidth210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          BlocBuilder<CartBloc,CartState>(
            builder: (context,state){
              if(state is CartLoading){
                return const CircularProgressIndicator();
              }
              if(state is CartLoaded){
                return Positioned(
                  right:0,
                  bottom:dimensions.positionedHeight100,
                  child: Container(
                    height: dimensions.containerHeight45,
                    width:dimensions.containerWidth45,
                    decoration: const BoxDecoration(
                      color: AvenueColors.iconBackgroundColorBlueAccent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topLeft:Radius.circular(30),
                      ),
                    ),
                    child: InkWell(
                      onTap: (){context.read<CartBloc>().add(AddProduct(product));},
                      child:const AvenueIcon(icon:Iconsax.add,size: 26,
                        color: AvenueColors.iconForegroundColorWhite,),
                    ),
                  ),
                );
              }
              return const Text('Something went wrong!');
            },

          ),

          Positioned(top: dimensions.positionedHeight250,
              child: Container(
                margin: EdgeInsets.only(
                    left: dimensions.horizontalPadding10,
                    top: dimensions.verticalPadding30,bottom: dimensions.verticalPadding20),
                height: dimensions.containerHeight100,
                width: dimensions.containerWidth200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Typographic(
                      text: product.name,
                      size:dimensions.font16 ,
                      color: AvenueColors.productDetColor,),
                    SizedBox(height: dimensions.sizedBox10,),
                    Typographic(
                      text: "MWK ${decimalPattern.format(product.price)}",
                      size:dimensions.font16 ,
                      color: AvenueColors.productDetColor,),
                  ],
                ),

              ),)
        ],
      ),
    );
  }
}
