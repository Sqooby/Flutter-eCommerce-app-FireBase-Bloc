// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;

  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  Product({
    required this.isPopular,
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
    };
  }

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '2',
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: '3',
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '4',
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '5',
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      id: '6',
      name: 'Smoothies #3',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      id: '7',
      name: 'Water #1',
      category: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
  //getting snapShot from FB
  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      isPopular: snap['isPopular'],
      id: snap['id'],
      category: snap['category'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
    );
    return product;
  }

  //added Product to FB
  // Future<void> addProductsToFirebase() async {
  //   final CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');
  //   for (final product in products) {
  //     await productsCollection.doc(product.id).set(product.toJson());
  //   }
  // }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];
}
