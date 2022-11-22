import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:avenue/logic/models/models.dart';
import 'package:avenue/data/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('Checkout').add(checkout.toDocument());
  }
}
