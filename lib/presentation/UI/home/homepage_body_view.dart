
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import 'package:avenue/logic/blocs/bloc.dart';

import '../../../util/dimensions.dart';
import 'components/popular_carousel.dart';
import 'components/product_carousel.dart';


class HomePageBodyView extends StatelessWidget  {


  const HomePageBodyView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Typographic(text: "Hey,Precious",size: 16,),
        SizedBox(height: dimensions.sizedBox20,),
        FadeInDown(
            delay:const Duration(milliseconds: 400,),duration: const Duration(milliseconds: 1000),

            child: Typographic(text: "Discover",size: dimensions.font24,),),
        SizedBox(height: dimensions.sizedBox30,),


        BlocBuilder<ProductBloc,ProductState>(
          builder: (context,state) {

            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),);
        }
            if(state is ProductLoaded) {
              return ProductCarousel(products: state.products
                  .where((product) => product.isRecommended)
                  .toList(),);
            }
            else { return const Text("nothing");}
      },
        ),
        SizedBox(height: dimensions.sizedBox50,),
        FadeInDown(
            delay:const Duration(milliseconds: 400,),
            duration: const Duration(milliseconds: 1000),
            child: Typographic(text: "Popular",size: dimensions.font24,),),

        SizedBox(height: dimensions.sizedBox20,),
        BlocBuilder<ProductBloc,ProductState>(builder:(context,state){
            if (state is ProductLoading){
              return const Center(
              child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded){
              return PopularCarousel(products: state.products
                  .where((product) => product.isPopular==true)
                  .toList(),);

    }
            else{
              return const Text("Nothing");
            }


        },)

      ],

    );
  }
}
