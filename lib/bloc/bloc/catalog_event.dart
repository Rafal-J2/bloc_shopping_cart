part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CatalogEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CatalogEvent {
final Product2 product2;
 const CartProductAdded({required this.product2});
 }

class CartProductRemoved extends CatalogEvent {
  final Product2 product2;
 const CartProductRemoved({required this.product2});
}
