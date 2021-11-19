import 'package:bloc/bloc.dart';
import 'package:bloc_shopping_cart_grid/ViewModels/view_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CartLoading());

  List<Product2> product2 = [];

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapCartProductRemovedToState(event, state);
    }
  }

  Stream<CatalogState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {}
  }

  // Stream<CatalogState> _mapCartProductAddedToState(
  //      CartProductAdded event, CatalogState state ) async* {
  //         if (state is CartLoaded) {
  //           try {
  //             yield CartLoaded(
  //               cart: Cart(
  //                 product2: List.from(state.cart.product2)..add(event.product2))
  //              );
  //           } catch (_) {}
  //         }
  //      }

  Stream<CatalogState> _mapCartProductAddedToState(
      CartProductAdded event, CatalogState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
             //   product2: List.from(state.cart.product2)..add(event.product2)));
                    product2: product2..add(event.product2)));
      } catch (_) {}
    }
  }

  Stream<CatalogState> _mapCartProductRemovedToState(
      CartProductRemoved event, CatalogState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                product2: List.from(state.cart.product2)
                  ..remove(event.product2)));
      } catch (_) {}
    }
  }
}
