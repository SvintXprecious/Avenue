import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:avenue/config/config.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avenue/logic/blocs/bloc.dart';

import '../../../../util/dimensions.dart';

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product',arguments: product);
      },
      child: Container(
        padding: EdgeInsets.only(right: dimensions.horizontalPadding10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit:BoxFit.cover,
                    image: NetworkImage(product.imageUrl),),
                borderRadius: BorderRadius.circular(30),

              ),),



            BlocBuilder<CartBloc,CartState>(
                builder: (context,state) {
                  if (state is CartLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is CartLoaded) {
                    return Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: dimensions.containerHeight50,
                        width: dimensions.containerWidth40,
                        decoration: const BoxDecoration(
                          color: AvenueColors.iconBackgroundColorBlueAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),),),
                        child: IconButton(
                          onPressed: (){context.read<CartBloc>().add(AddProduct(product));},
                          icon: const AvenueIcon(icon: Iconsax.add,size: 26,
                            color: AvenueColors.iconForegroundColorWhite,),
                        ),
                      ),
                    );
                  }
                  else {
                    return const Text("data");
                  }
                },),


          ],
        ),
      ),
    );
  }
}
