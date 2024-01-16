import 'package:e_commerce/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    "GO TO CHECKOUT",
                    style: Theme.of(context).textTheme.displayMedium,
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LIST OF PRODUCTS IN CART

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add \$ 20.0 for FREE delivery',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add more Items',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CartProductCard(
                  product: Product.products[0],
                ),
                CartProductCard(
                  product: Product.products[1],
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),

            // TOLTA FEE

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SUBTOTAL',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            '\$5,96',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DELIVERY FEE',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            '\$1,96',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$12,96',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
