import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
