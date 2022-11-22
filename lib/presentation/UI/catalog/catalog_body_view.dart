import 'package:avenue/presentation/UI/catalog/components/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:avenue/presentation/widgets/widgets.dart';

import '../../../util/dimensions.dart';

class CatalogPageView extends StatelessWidget {
  const CatalogPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);

    return Container(
      padding: EdgeInsets.only(bottom: dimensions.verticalPadding20,top: dimensions.verticalPadding10),
      child: const TabBarViewBody(),

    );
  }
}
