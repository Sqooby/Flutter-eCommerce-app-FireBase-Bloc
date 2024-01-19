import 'package:e_commerce/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
