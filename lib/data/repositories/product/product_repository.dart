import 'package:avenue/logic/models/models.dart';
import 'package:avenue/data/repositories/product/base_product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository extends BaseProductRepository{
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore}):
        _firebaseFirestore=firebaseFirestore?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('Products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
