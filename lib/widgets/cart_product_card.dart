import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

// widget that shown product in cart
class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return Row(
              children: [
                //Image of product

                Image.network(
                  product.imageUrl,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name and Price of product

                    Text(product.name, style: Theme.of(context).textTheme.displaySmall),
                    Text('\$${product.price}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black)),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),

                //remove button

                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartProductRemoved(product));
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text(
                  '$quantity',
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                //add button

                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartProductAdded(product));
                  },
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
