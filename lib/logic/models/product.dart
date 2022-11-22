import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId:0)
class Product extends Equatable{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final bool isRecommended;

  @HiveField(6)
  final bool isPopular;

  @HiveField(7)
  final String? description;

  @HiveField(8)
  final String seller;



  const Product(
      this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.category,
      this.isRecommended,
      this.isPopular,
      this.description,
      this.seller);

  static Product fromSnapshot(DocumentSnapshot snap){

    Product product=Product(
      snap.id,
      snap['name'],
      snap['imageUrl'],
      snap['price'],
      snap['category'],
      snap['isRecommended'],
      snap['isPopular'],
      snap['description'],
      snap['seller']
    );

    return product;
  }

  @override
  List<Object?> get props =>[id,name,imageUrl,price,category,isRecommended,isPopular,description];

}