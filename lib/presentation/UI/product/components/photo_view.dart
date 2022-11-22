import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:avenue/logic/models/models.dart';


class PhotoViewUI extends StatelessWidget {
  const PhotoViewUI({Key? key,required this.product}) : super(key: key);

  static const String routeName='/photoview';
  final Product product;

  static Route route({required Product product}){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (context) => PhotoViewUI(product: product,),);
  }


  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: PhotoView(imageProvider:NetworkImage(product.imageUrl),),


    );
  }
}
