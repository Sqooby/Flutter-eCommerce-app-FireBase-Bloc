part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? mail;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;

  UpdateCheckout({
    this.fullName,
    this.mail,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cart,
  });

  List<Object?> get props => [
        fullName,
        mail,
        address,
        city,
        country,
        zipCode,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  ConfirmCheckout({required this.checkout});

  List<Object?> get props => [checkout];
}
