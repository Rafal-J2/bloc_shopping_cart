part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

//class LoadedData extends LearnBlocEvent {}

// New
class CartStarted extends CatalogEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CatalogEvent {
//  List<Product2>? product2;
 
final Product2 product2;
 const CartProductAdded({required this.product2});

  //  @override
  // List<Object> get props => [product2];
 }

class CartProductRemoved extends CatalogEvent {
  final Product2 product2;
 const CartProductRemoved({required this.product2});

  // @override
  // List<Object> get props => [product2];
}



// class CartItemAdded extends LearnBlocEvent {
//   const CartItemAdded(this.item);

//   final Product item;

//   @override
//   List<Object> get props => [item];
// }
