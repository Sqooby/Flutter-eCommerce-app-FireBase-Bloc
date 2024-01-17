part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  final Cart cart;

  CartLoaded({this.cart = const Cart()});
  @override
  List<Object> get props => [cart];
}

final class CartError extends CartState {
  @override
  List<Object> get props => [];
}
