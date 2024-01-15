import 'package:e_commerce/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category category;

  const CatalogScreen({super.key, required this.category});
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    //List product with the same Category
    final List<Product> categoryProduct =
        Product.products.where((product) => product.category == category.name).toList();

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomBottomBar(),
      body:
          // gridView with products
          GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categoryProduct.length,
        itemBuilder: (context, index) {
          //Card displaying product
          return ProductCard(
            product: categoryProduct[index],
            widthFactor: 2.2,
          );
        },
      ),
    );
  }
}
