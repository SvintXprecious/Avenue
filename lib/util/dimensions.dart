import 'package:flutter/material.dart';

class Dimensions{
  late final int _screenHeight;
  late final int _screenWidth;

  Dimensions({required BuildContext context}){
    Size size=MediaQuery.of(context).size;
    _screenHeight=size.height.round();
    _screenWidth=size.width.round();

  }

  double get toolbarHeight40 => _screenHeight /(_screenHeight/40);
  double get toolbarHeight65 => _screenHeight /(_screenHeight/65);
  double get toolbarHeight50 => _screenHeight /(_screenHeight/50);


  double get sizedBox5 => _screenHeight /(_screenHeight/5);
  double get sizedBox10 => _screenHeight /(_screenHeight/10);
  double get sizedBox20 => _screenHeight /(_screenHeight/20);
  double get sizedBox30 => _screenHeight /(_screenHeight/30);
  double get sizedBox40 => _screenHeight /(_screenHeight/40);
  double get sizedBox50 => _screenHeight /(_screenHeight/50);
  double get sizedBox350 => _screenHeight /(_screenHeight/350);

  double get sizedBoxWidth10 => _screenWidth /(_screenWidth/10);
  double get sizedBoxWidth5 => _screenWidth /(_screenWidth/5);


  double get containerHeight30 => _screenHeight /(_screenHeight/40);
  double get containerHeight45 => _screenHeight /(_screenHeight/45);
  double get containerHeight50 => _screenHeight /(_screenHeight/50);
  double get containerHeight100 => _screenHeight /(_screenHeight/100);
  double get containerHeight110 => _screenHeight /(_screenHeight/110);
  double get containerHeight120 => _screenHeight /(_screenHeight/120);
  double get containerHeight200 => _screenHeight /(_screenHeight/200);
  double get containerHeight80 => _screenHeight /(_screenHeight/80);
  double get containerHeight700 => _screenHeight /(_screenHeight/700);




  double get containerWidth40 => _screenWidth /(_screenWidth/40);
  double get containerWidth45 => _screenWidth /(_screenWidth/45);
  double get containerWidth100 => _screenWidth /(_screenWidth/100);
  double get containerWidth110 => _screenWidth /(_screenWidth/110);
  double get containerWidth120 => _screenWidth /(_screenWidth/120);
  double get containerWidth180 => _screenWidth /(_screenWidth/180);
  double get containerWidth250 => _screenWidth /(_screenWidth/250);
  double get containerWidth200 => _screenWidth /(_screenWidth/200);
  double get containerHeight250 => _screenHeight /(_screenHeight/250);
  double get containerHeight400 => _screenHeight /(_screenHeight/400);
  double get containerWidth210 => _screenWidth /(_screenWidth/210);



  double get horizontalPadding6 => _screenWidth /(_screenWidth/6);
  double get horizontalPadding10 => _screenWidth /(_screenWidth/10);
  double get horizontalPadding12 => _screenWidth /(_screenWidth/12);
  double get horizontalPadding19 => _screenWidth /(_screenWidth/19);
  double get horizontalPadding20 => _screenWidth /(_screenWidth/20);
  double get horizontalPadding22 => _screenWidth /(_screenWidth/22);
  double get horizontalPadding30 => _screenWidth /(_screenWidth/30);
  double get horizontalPadding60 => _screenWidth /(_screenWidth/60);

  double get positionedWidth25 => _screenWidth /(_screenWidth/25);
  double get positionedHeight60 => _screenHeight /(_screenHeight/60);
  double get positionedHeight100 => _screenHeight /(_screenHeight/100);
  double get positionedHeight250 => _screenHeight /(_screenHeight/250);
  double get positionedHeight320 => _screenHeight /(_screenHeight/320);
  double get positionedHeight350 => _screenHeight /(_screenHeight/350);
  double get positionedHeight370 => _screenHeight /(_screenHeight/370);








  double get verticalPadding1 => _screenHeight /(_screenHeight/1);
  double get verticalPadding5 => _screenHeight /(_screenHeight/5);
  double get verticalPadding10 => _screenHeight /(_screenHeight/10);
  double get verticalPadding14 => _screenHeight /(_screenHeight/14);
  double get verticalPadding20 => _screenHeight /(_screenHeight/20);
  double get verticalPadding30 => _screenHeight /(_screenHeight/30);
  double get verticalPadding60 => _screenHeight /(_screenHeight/60);


  double get font18 => _screenWidth /(_screenWidth/18);
  double get font14 => _screenWidth /(_screenWidth/14);
  double get font13 => _screenWidth /(_screenWidth/13);
  double get font15 => _screenWidth /(_screenWidth/15);
  double get font16 => _screenWidth /(_screenWidth/16);
  double get font17 => _screenWidth /(_screenWidth/17);
  double get font22 => _screenWidth /(_screenWidth/22);
  double get font24 => _screenWidth /(_screenWidth/24);
  double get font32 => _screenWidth /(_screenWidth/32);


}