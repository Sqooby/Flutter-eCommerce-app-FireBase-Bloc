// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Unicorn'),
      bottomNavigationBar: const CustomBottomBar(),
      //slider
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: Category.categories.map((category) => HeroCarouselCard(category: category)).toList(),
          ),

          SectionTitle(title: "RECOMMENDED"),

          //Recommended Product Carousel

          ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList()),

          SectionTitle(title: "MOST POPULAR"),

          //Most Popular Product Carousel

          ProductCarousel(products: Product.products.where((product) => product.isPopular).toList()),
        ],
      ),
    );
  }
}
