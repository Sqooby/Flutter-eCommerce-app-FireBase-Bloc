import 'package:e_commerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  const OrderScreen({
    Key? key,
  }) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => OrderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: const CustomBottomBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('lib/assets/svg/garlands.svg'),
                ),
                Positioned(
                  top: 200,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Your order is complete!",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE:  123XYZ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thanks you for purchasing on Unicorn ",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ORDER CODE:  123XYZ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                  ),
                  const OrderSummary(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Details",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                      OrderSummaryProductCard(
                        product: Product.products[1],
                        quantity: 2,
                      ),
                      OrderSummaryProductCard(
                        product: Product.products[3],
                        quantity: 2,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
