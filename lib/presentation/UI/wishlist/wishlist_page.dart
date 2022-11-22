import 'package:avenue/config/config.dart';
import 'package:avenue/presentation/UI/wishlist/wishlist_body_view.dart';
import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../util/dimensions.dart';

class WishlistUI extends StatelessWidget {
  const WishlistUI({Key? key}) : super(key: key);

  static const String routeName='/wishlist';

  static Route route(){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (_) => const WishlistUI(),);
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: dimensions.horizontalPadding20,top: dimensions.verticalPadding10),
          child: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: const AvenueIcon(icon: Iconsax.arrow_left_1,
              size: 26,color: AvenueColors.iconForegroundColorBlack,),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: Typographic(text: "Wishlist",size: 18,),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: dimensions.toolbarHeight50,
        backgroundColor: AvenueColors.backgroundColor,
      ),
      body: const WishListBodyView(),
      bottomNavigationBar: GNav(
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
