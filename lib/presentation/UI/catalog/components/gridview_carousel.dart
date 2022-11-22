import 'package:avenue/logic/blocs/product/product_bloc.dart';
import 'package:avenue/presentation/UI/catalog/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/dimensions.dart';

class GridViewProductCarousel extends StatelessWidget {
  
  const GridViewProductCarousel({Key? key,required this.products}) : super(key: key);
  final List<Product> products;


  @override
  Widget build(BuildContext context) {


    return GridView.builder(itemCount: products.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context,index) => CatalogProductCard(product: products[index],),);
  }
}
