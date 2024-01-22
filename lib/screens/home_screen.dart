// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/blocs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      bottomNavigationBar: const CustomBottomBar(
        screen: routeName,
      ),
      //slider
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  items: state.categories.map((category) => HeroCarouselCard(category: category)).toList(),
                );
              } else {
                return const Text('Sth went wrong');
              }
            },
          ),

          SectionTitle(title: "RECOMMENDED"),

          //Recommended Product Carousel

          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(products: state.products.where((product) => product.isRecommended).toList());
              } else {
                return const Text("Sth went wrong");
              }
            },
          ),

          SectionTitle(title: "MOST POPULAR"),

          //Most Popular Product Carousel

          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(products: state.products.where((product) => product.isPopular).toList());
              } else {
                return const Text("Sth went wrong");
              }
            },
          )
        ],
      ),
    );
  }
}
