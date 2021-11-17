part of 'catalog_bloc.dart';



@immutable
abstract class CatalogState extends Equatable {
  const CatalogState();

}

class CartLoading extends CatalogState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CatalogState {
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class CartError extends CatalogState {
  @override
  List<Object> get props => [];
}
