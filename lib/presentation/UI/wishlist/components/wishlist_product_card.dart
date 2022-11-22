import 'package:flutter/material.dart';
import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:avenue/util/number_format.dart';
import 'package:avenue/logic/models/models.dart';

import '../../../../util/dimensions.dart';

class WishListProductCard extends StatelessWidget {
  const WishListProductCard({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return InkWell(
      onTap: (){
        //Navigator.pushNamed(context, '/product',arguments: product);
      },
      child: Container(
        margin:EdgeInsets.only(bottom: dimensions.verticalPadding5,top: dimensions.verticalPadding10),
        child: Row(
          children: [
            //image section
            Container(
              height:dimensions.containerHeight120,
              width: dimensions.containerWidth120,
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
                height: dimensions.containerHeight120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(20),
                    bottomRight:Radius.circular(30),
                  ),

                  color: Colors.white,

                ),

                child: Padding(
                  padding:EdgeInsets.only(
                      left: dimensions.horizontalPadding20,
                      right: dimensions.horizontalPadding10,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Typographic(
                        text: product.name,
                        size: 16,
                        color: AvenueColors.productDetColor,),

                      SizedBox(height: dimensions.sizedBox10,),
                      Row(
                        children: [
                          Typographic(text: "Price:",size: 14,color: AvenueColors.typographyGrey,),
                          SizedBox(width: dimensions.sizedBoxWidth5,),
                          Typographic(
                            text: "MWK ${decimalPattern.format(product.price)}",
                            size: 16,
                            color: AvenueColors.productDetColor,),
                        ],
                      ),

                      SizedBox(height: dimensions.sizedBox10,),

                      OutlineContainer(
                        wrapWidth: dimensions.containerWidth120,
                        wrapHeight: dimensions.containerHeight30,
                        borderColor: AvenueColors.borderOutlineBlueAccent,
                        child: Typographic(
                          text: "Add to bag",
                          size: 12,
                          color: AvenueColors.typographyBlueAccent,),
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
