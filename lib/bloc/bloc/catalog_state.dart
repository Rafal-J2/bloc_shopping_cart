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
   @override
  List<Object> get props => [];
}

class CartError extends CatalogState {
  @override
  List<Object> get props => [];
}
