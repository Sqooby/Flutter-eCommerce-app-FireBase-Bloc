import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? mail;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  Checkout(
      {required this.fullName,
      required this.mail,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.subtotal,
      required this.deliveryFee,
      required this.total,
      required this.products});

  Map<String, Object> toDocument() {
    Map custommerAddress = Map();

    custommerAddress['address'] = address;
    custommerAddress['city'] = city;
    custommerAddress['country'] = country;
    custommerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': custommerAddress,
      'customerName': fullName!,
      'customerEmail': mail!,
      'products': products!.map((product) => product.name),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        fullName,
        mail,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products,
      ];
}
