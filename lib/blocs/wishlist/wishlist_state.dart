part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistLoading extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;
  const WishlistLoaded({this.wishlist = const Wishlist()});
  @override
  List<Object> get props => [wishlist];
}

final class WishlistError extends WishlistState {}
