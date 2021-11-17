import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product2 {
  String? image, text;
  Product2({this.image, this.text});

 
}

class ShopItem {
  String? imageUrl;
  ShopItem({
    this.imageUrl,
  });
}


// New
@immutable
class Cart2 extends Equatable {
  final List<ShopItem> shopItems;

 const Cart2({this.shopItems = const <ShopItem>[]});

  @override
  List<Object> get props => [shopItems];
}

@immutable
class Cart extends Equatable {
  final List<Product2> product;

 const Cart({this.product = const <Product2>[]});

  @override
  List<Object> get props => [product];
}