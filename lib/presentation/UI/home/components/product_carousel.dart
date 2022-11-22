
import 'package:avenue/presentation/UI/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../util/dimensions.dart';

class ProductCarousel  extends StatelessWidget {
    final List<Product> products;
    final bool? isRecommendedCarousel;
    final bool? isMostPopularCarousel;

    const ProductCarousel({
    Key? key,
    required this.products,
    this.isRecommendedCarousel,
    this.isMostPopularCarousel,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return FadeInLeft(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
      height: dimensions.sizedBox350,
      child:
      ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.only(right: dimensions.horizontalPadding20),
                child: RecommendedProductCard(product:products[index]),);
          },
          ),),
    );
  }
}
