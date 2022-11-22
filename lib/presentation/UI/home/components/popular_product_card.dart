
import 'package:avenue/config/colors.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/number_format.dart';

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product',arguments: product);
      },
      child: Container(
        margin:EdgeInsets.only(bottom: dimensions.verticalPadding10,top: dimensions.verticalPadding10),
        child: Row(
          children: [
            //image section
            Container(
              height:dimensions.containerHeight100,
              width: dimensions.containerWidth100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38,
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
              ),
            ),

            //text container
            Expanded(
              child: Container(
                height: dimensions.containerHeight100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(30),
                    bottomRight:Radius.circular(30),
                  ),
                  color: Colors.white,

                ),

                child:
                Padding(
                  padding:EdgeInsets.only(left: dimensions.horizontalPadding20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Typographic(
                        text: product.name,
                        size: dimensions.font16,
                        color: AvenueColors.productDetColor,),

                      SizedBox(height: dimensions.sizedBox10,),
                      Typographic(
                        text: "MWK ${decimalPattern.format(product.price)}",
                        size: dimensions.font16,
                        color: AvenueColors.productDetColor,),

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
