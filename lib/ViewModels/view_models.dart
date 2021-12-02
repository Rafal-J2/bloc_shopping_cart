import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product2 {
  String? image, text, name;
  int? price;
  Color? backgroundColor;
  Product2({
    this.image,
    this.text,
    this.name,
    this.price,
    this.backgroundColor,
  });
}

@immutable
class Cart extends Equatable {
  final List<Product2> product2;

  const Cart({this.product2 = const <Product2>[]});

  @override
  List<Object> get props => [product2];
}


