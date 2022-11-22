import 'package:avenue/logic/blocs/wishlist/wishlist_bloc.dart';
import 'package:avenue/presentation/UI/wishlist/components/empty_wishlist.dart';
import 'package:avenue/presentation/UI/wishlist/components/wishlist_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/dimensions.dart';

class WishListBodyView extends StatelessWidget {
  const WishListBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Container(
      margin: EdgeInsets.only(
          left: dimensions.horizontalPadding20,
          right: dimensions.horizontalPadding20,
          top: dimensions.verticalPadding20,),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WishlistBloc,WishlistState>(
                builder:(context,state){
                  if(state is WishlistLoading){
                    return const CircularProgressIndicator();
                  }
                  if(state is WishlistLoaded){
                    if(state.wishlist.products.isEmpty){
                      return const EmptyWishlist();

                    }
                    return WishListCarousel(products: state.wishlist.products,);
                  }
                  return Text('');

            },)



          ],
        ),
      ),
    );
  }
}
