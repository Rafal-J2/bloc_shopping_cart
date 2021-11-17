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
  final ShopItem shopItems;
  const CartProductAdded(this.shopItems);

  @override
  List<Object> get props => [shopItems];
}

class CartProductRemoved extends CatalogEvent {
  final Product2 product;
  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}



// class CartItemAdded extends LearnBlocEvent {
//   const CartItemAdded(this.item);

//   final Product item;

//   @override
//   List<Object> get props => [item];
// }
