import 'package:avenue/config/config.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:avenue/presentation/UI/catalog/components/gridview_carousel.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/dimensions.dart';

class TabBarViewBody extends StatefulWidget {
  const TabBarViewBody({Key? key}) : super(key: key);

  @override
  State<TabBarViewBody> createState() => _TabBarViewBodyState();
}

class _TabBarViewBodyState extends State<TabBarViewBody>  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    TabController tabController=TabController(length: 5, vsync: this);
    Dimensions dimensions=Dimensions(context: context);

    return Column(
      children:[

        FadeInDown(
          delay:const Duration(milliseconds: 400,),
          duration: const Duration(milliseconds: 1000),
          child:  Padding(
            padding: EdgeInsets.only(left: dimensions.horizontalPadding20),
            child: Align(alignment: Alignment.topLeft,
                child: Typographic(text: "Collections",size: 24,),),
          ),),

        Container(
          padding: EdgeInsets.only(top:dimensions.verticalPadding20),
          child:Align(
            alignment: Alignment.centerLeft,
            child: FadeInUp(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 1000),
              child: TabBar(
                labelPadding: EdgeInsets.only(left: dimensions.horizontalPadding20,right: dimensions.horizontalPadding20),
                labelStyle:GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),) ,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AvenueColors.backgroundColorBlueAccent,
                isScrollable: true,
                controller: tabController,
                labelColor: AvenueColors.typographyDefaultColor,
                unselectedLabelColor: AvenueColors.typographyGrey,
                tabs:  const [
                Tab(text:"Skincare",),
                Tab(text: "Wellness",),
                Tab(text: "Beverages",),
                Tab(text: "Fashion",),
                Tab(text: "Electronics",)
              ],
        ),
            ),
          ),
      ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: dimensions.horizontalPadding10,top: dimensions.verticalPadding20),
            child: FadeInLeft(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 400),

              child: TabBarView(
                controller: tabController,
                children:  [
                  BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
                    if(state is ProductLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is ProductLoaded){
                      return GridViewProductCarousel(products: state.products
                          .where((property) => property.category=="skincare")
                          .toList(),);

                    }
                    else{
                      return const Text("Something happened");
                    }
                  },
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
                    if(state is ProductLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is ProductLoaded){
                      return GridViewProductCarousel(products: state.products
                          .where((property) => property.category=="wellness")
                          .toList(),);

                    }
                    else{
                      return const Text("Something happened");
                    }
                  },
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
                    if(state is ProductLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is ProductLoaded){
                      return GridViewProductCarousel(products: state.products.
                      where((property) => property.category=="Beverages").
                      toList(),);

                    }
                    else{
                      return const Text("Something happened");
                    }
                  },
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
                    if(state is ProductLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is ProductLoaded){
                      return GridViewProductCarousel(products: state.products
                          .where((property) => property.category=="fashion")
                          .toList(),);

                    }
                    else{
                      return const Text("Something happened");
                    }
                  },
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
                    if(state is ProductLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is ProductLoaded){
                      return GridViewProductCarousel(products: state.products
                          .where((property) => property.category=="Electronics")
                          .toList(),);

                    }
                    else{
                      return const Text("Something happened");
                    }
                  },
                  ),


                ],
              ),
            ),
          ),
        )


      ],
    );
  }
}
