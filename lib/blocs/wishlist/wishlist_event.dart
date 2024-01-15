part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent {}

class AddProduct extends WishlistEvent {
  final Product product;
  const AddProduct(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveProduct extends WishlistEvent {
  final Product product;
  const RemoveProduct(this.product);
  @override
  List<Object> get props => [product];
}
