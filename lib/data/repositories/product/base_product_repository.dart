
import '../../../logic/models/product.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}