// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/models/Wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  final void Function()? deleteFun;
  const ProductCard({
    Key? key,
    required this.product,
    required this.widthFactor,
    this.leftPosition = 5,
    this.isWishlist = false,
    this.deleteFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: leftPosition,
            top: 60,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            left: leftPosition,
            top: 65,
            child: Container(
              width: widthValue - 20 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    isWishlist
                        ? Expanded(
                            child: BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<WishlistBloc>().add(RemoveProduct(product));
                                    const snackBar = SnackBar(content: Text('remove product from  your Wishlist! '));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
