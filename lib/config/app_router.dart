import 'package:avenue/presentation/UI/UI.dart';
import 'package:avenue/presentation/UI/catalog/catalog_screen.dart';
import 'package:avenue/presentation/UI/checkout/checkout_ui.dart';
import 'package:avenue/presentation/UI/order_confirmation/order_confirmationUI.dart';
import 'package:avenue/presentation/UI/product/components/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/models/models.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return HomePageUI.route();

      case HomePageUI.routeName:
        return HomePageUI.route();

      case ProductDetailsUi.routeName:
        return ProductDetailsUi.route(product: settings.arguments as Product);


      case CartUI.routeName:
        return CartUI.route();

      case WishlistUI.routeName:
        return WishlistUI.route();

      case CatalogPageUI.routeName:
        return CatalogPageUI.route();

      case PhotoViewUI.routeName:
        return PhotoViewUI.route(product: settings.arguments as Product);

      case CheckoutUI.routeName:
        return CheckoutUI.route();

      case OrderConfirmationUI.routeName:
        return OrderConfirmationUI.route();


      default:
        return _errorRoute();

    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder:(_) => Scaffold(
          appBar: AppBar(title: const Text("error"),),
          body: const Center(child: Text("something went wrong")),
        ),);
  }
}