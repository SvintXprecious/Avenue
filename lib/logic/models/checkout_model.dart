import 'package:avenue/util/order_number.dart';
import 'package:equatable/equatable.dart';
import 'package:avenue/logic/models/models.dart';

class Checkout extends Equatable {

  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final DateTime? createdAt;
  final String? checkoutID;

  const Checkout( {
    required this.fullName,
    required this.address,
    required this.city,
    required this.country,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    this.checkoutID,
    this.createdAt,

  });

  @override
  List<Object?> get props => [
        fullName,
        address,
        city,
        country,
        products,
        subtotal,
        deliveryFee,
        total,checkoutID,createdAt
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'products': products!.map((product) => product.id).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'createdAt':DateTime.now(),

      'checkoutID':generateOrderID(),
    };
  }
}
