import 'package:avenue/presentation/UI/wishlist/components/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:avenue/config/config.dart';

import '../../../../util/dimensions.dart';

class WishListCarousel extends StatelessWidget {
  const WishListCarousel({Key? key,required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return FadeInUp(
      delay:const Duration(milliseconds: 400,),
      duration: const Duration(milliseconds: 1000),
      child:Column(
        children: [
          Typographic(text: "${products.length} results",size: 14,color: AvenueColors.typographyGrey,),
          SizedBox(height: dimensions.sizedBox5,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context,index){
              return WishListProductCard(product: products[index],);
            },

          ),
        ],
      ),
    );
  }
}
