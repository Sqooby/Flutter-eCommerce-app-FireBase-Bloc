import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onStartCart);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemoved>(_onCartProdcutRemoved);
  }
  void _onStartCart(event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  void _onCartProductAdded(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onCartProdcutRemoved(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
