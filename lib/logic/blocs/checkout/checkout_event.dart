part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final Cart? cart;

  const UpdateCheckout({
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.cart,
  });

  @override
  List<Object?> get props => [
        fullName,
        address,
        city,
        country,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
