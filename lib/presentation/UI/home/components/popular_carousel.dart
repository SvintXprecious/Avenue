
import 'package:avenue/presentation/UI/home/components/popular_product_card.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:animate_do/animate_do.dart';

class PopularCarousel extends StatelessWidget {
  const PopularCarousel({Key? key,
    required this.products,
    this.isMostPopularCarousel,
    this.isRecommendedCarousel,}) : super(key: key);

  final List<Product> products;
  final bool? isRecommendedCarousel;
  final bool? isMostPopularCarousel;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay:const Duration(milliseconds: 400,),
      duration: const Duration(milliseconds: 1000),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context,index){

              return PopularProductCard(product: products[index],);

            },

      ),
    );
  }
}
