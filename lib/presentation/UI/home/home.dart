import 'package:avenue/config/config.dart';
import 'package:avenue/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'homepage_body_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePageUI extends StatelessWidget {
  static const String routeName='/';

  static Route route(){
    return MaterialPageRoute(
        settings:const RouteSettings(name: routeName),
        builder: (_) => const HomePageUI(),);
  }
  const HomePageUI({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);


    return Scaffold(
      //backgroundColor: AvenueColors.backgroundColor,
      appBar: AppBar(
        title:Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Avenue',
                  style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: dimensions.font18,
                      fontWeight: FontWeight.w500, color: AvenueColors.typographyBlack))),

              const TextSpan(
                  text: '.',
                  style: TextStyle(fontSize:32,color: AvenueColors.iconBackgroundColorBlueAccent))
            ]),
          ),
        ),
        actions: [

          BlocBuilder<CartBloc,CartState>(
            builder: (context,state){
              if(state is CartLoaded){
                Map cart = state.cart.productQuantity(state.cart.products);
                if (cart.isEmpty){
                  return Padding(
                    padding: EdgeInsets.only(right: dimensions.horizontalPadding20,top: dimensions.verticalPadding10),
                    child: IconButton(onPressed: (){Navigator.pushNamed(context, '/cart');},
                      icon:const AvenueIcon(
                        icon:Iconsax.shopping_bag,
                        size: 26,
                        color: Colors.black,),),
                  );

                }
                return Badge(
                  badgeContent: Typographic(
                    text:cart.length.toString(),
                    size: 12,
                    fontWeight: FontWeight.normal,
                    color: AvenueColors.backgroundColor,),
                  position: BadgePosition.topEnd(top: dimensions.verticalPadding14,end:dimensions.horizontalPadding22),
                  badgeColor: Colors.red,
                  child:  Padding(
                    padding: EdgeInsets.only(right: dimensions.horizontalPadding19,top: dimensions.verticalPadding10),
                    child: IconButton(onPressed: (){Navigator.pushNamed(context, '/cart');},
                      icon:const AvenueIcon(
                        icon:Iconsax.shopping_bag,
                        size: 26,
                        color: Colors.black,),),
                  ),

                );
              }
              else{
                return const Text("Nothing");
              }
              },),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        automaticallyImplyLeading: true,
        toolbarHeight: dimensions.toolbarHeight65,
      ),
      body:SafeArea(
        child: Container(

          margin: EdgeInsets.only(
              left: dimensions.horizontalPadding20,
              right: dimensions.horizontalPadding20,
              top: dimensions.verticalPadding10,),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   const [

              Expanded(
                  child: SingleChildScrollView(
                    child: HomePageBodyView(),
                  ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar:GNav(
        backgroundColor: AvenueColors.backgroundColorLightGray,
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 40,
           // tab button border// tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: const Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: AvenueColors.iconBackgroundColorBlueAccent, // selected icon and text color
          iconSize: 30, // tab button icon size
          tabBackgroundColor: Colors.blueAccent.withOpacity(0.1),
          tabMargin:  EdgeInsets.only(
              left: dimensions.horizontalPadding20,
              right:  dimensions.horizontalPadding20,
              bottom: dimensions.verticalPadding5,
              top: dimensions.verticalPadding5),
          // selected tab background color
          padding:EdgeInsets.only(left: dimensions.horizontalPadding20,right: dimensions.horizontalPadding20,top:dimensions.verticalPadding10,bottom: dimensions.verticalPadding10), // navigation bar padding
          tabs: [
            GButton(
              icon: Iconsax.home,
              text: "Home",
              textSize: 14,
              onPressed: (){Navigator.pushNamed(context, '/');},
            ),
            GButton(
              onPressed: (){Navigator.pushNamed(context, '/cart');},
              icon: Iconsax.shopping_bag,
              text: 'Bag',
            ),
            GButton(
              onPressed: (){Navigator.pushNamed(context, '/catalog');},
              icon: Iconsax.radar,
              text: 'Explore',
            ),

          ]
      ) ,
    );
  }
}
