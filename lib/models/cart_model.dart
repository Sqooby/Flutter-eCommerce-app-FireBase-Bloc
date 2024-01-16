import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

  //getter for subtotal price
  double get subtotal => products.fold(0, (total, current) => total + current.price);

  // function for delivery price
  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0;
    } else {
      return 10;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  //getter for totalSring

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  //getter for FreeDeliveryString

  String get freeDeliveryString => freeDelivery(subtotal);

  // getter for subTotalString
  String get subTotalString => subtotal.toStringAsFixed(2);

  // getter for delivery FeeString
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  List<Product> products = [
    Product(
      id: '1',
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '3',
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
  ];
  @override
  List<Object?> get props => [];
}
