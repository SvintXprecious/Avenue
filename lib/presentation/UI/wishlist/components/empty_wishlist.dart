import 'package:avenue/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: dimensions.horizontalPadding20,right: dimensions.horizontalPadding20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Typographic(text: "Your wishlist is empty"),
            ],

          ),
        ),
      ),
    );
  }
}
