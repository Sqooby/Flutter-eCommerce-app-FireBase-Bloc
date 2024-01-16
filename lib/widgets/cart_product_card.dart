import 'package:flutter/material.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
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
              Text(product.name, style: Theme.of(context).textTheme.displaySmall),
              Text('\$${product.price}', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black)),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle),
          ),
          Text('1', style: Theme.of(context).textTheme.displaySmall),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
