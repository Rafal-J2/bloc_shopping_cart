import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product2 {
  String? image, text;
  Product2({this.image, this.text});
}

@immutable
class Cart extends Equatable {
  final List<Product2> product2;

 const Cart({this.product2 = const <Product2>[]});

  @override
  List<Object> get props => [product2];
}

// class ShopItem {
//   String? imageUrl;
//   ShopItem({
//     this.imageUrl,
//   });
// }


// New
// @immutable
// class Cart2 extends Equatable {
//   final List<ShopItem> shopItems;

//  const Cart2({this.shopItems = const <ShopItem>[]});

//   @override
//   List<Object> get props => [shopItems];
// }

