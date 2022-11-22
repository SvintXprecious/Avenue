import 'package:equatable/equatable.dart';
import 'package:avenue/logic/models/product.dart';




class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  int get subtotal =>
      products.fold(0, (total, current) => total.toInt() + current.price);

  int deliveryFee(subtotal) =>  0;



  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

 int  total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get subtotalString => subtotal.toString();

  String get totalString => total(subtotal, deliveryFee).toString();

  String get freeDeliveryString => freeDelivery(subtotal);
}
