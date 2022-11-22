import 'package:avenue/presentation/UI/catalog/catalog_body_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../util/dimensions.dart';

class CatalogPageUI extends StatelessWidget {
  static const String routeName='/catalog';

  static Route route(){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (_) => const CatalogPageUI(),);
  }
  const CatalogPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
          padding: EdgeInsets.only(left: dimensions.horizontalPadding10,top: dimensions.horizontalPadding10),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const AvenueIcon(
              icon: Iconsax.arrow_left_1,
              size:24,
              color: AvenueColors.iconForegroundColorBlack,),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: Typographic(text: "Catalog",size: 18,),
        ),
        actions: [

          Padding(
            padding: EdgeInsets.only(top:  dimensions.verticalPadding10,right: dimensions.verticalPadding20),
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/wishlist');
              },
              icon: const AvenueIcon(icon: Iconsax.archive_11,
                color: AvenueColors.iconForegroundColorBlack,),),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        automaticallyImplyLeading:true,
        toolbarHeight: dimensions.toolbarHeight65,
      ),
      body: const CatalogPageView(),
      bottomNavigationBar: GNav(
          backgroundColor: AvenueColors.backgroundColorLightGray,
          selectedIndex :2,
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
