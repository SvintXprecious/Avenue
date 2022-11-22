import 'package:flutter/material.dart';
import '../../../util/dimensions.dart';
import '../../widgets/typographic.dart';
import 'dashboard_body.dart';

class DashboardUI extends StatelessWidget {
  const DashboardUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Scaffold(
      appBar: AppBar(

        title:Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10),
          child: Typographic(text:"Avenue",size: 18, ),
        ),
        centerTitle: true,
      ),

      body: const DashboardBodyView(),

    );
  }
}
