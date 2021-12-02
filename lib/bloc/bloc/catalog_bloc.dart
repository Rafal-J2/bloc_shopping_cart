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
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    yield CartLoading();
    if (event is CartStarted) {
      yield* _mapCartStarted(event, state);
    } else if (event is CartProductAdded) {
      yield* _mapCartAdded(event);
    } else if (event is CartProductRemoved) {
      yield* _mapCartRemoved(event);
    }
     yield CartLoaded();

  }

  Stream<CatalogState> _mapCartStarted(
      CatalogEvent event, CatalogState state) async* {
    yield CartLoading();
    await Future<void>.delayed(const Duration(seconds: 1));
    yield CartLoading();
  }

  Stream<CatalogState> _mapCartAdded(
    CatalogEvent event,
  ) async* {
   // try {
      if (event is CartProductAdded) {
        product2.add(event.product2);
        debugPrint('*****if (event is CartProductAdded)');
      }
 // } catch (_) {}
  }

  Stream<CatalogState> _mapCartRemoved(
    CatalogEvent event,
  ) async* {
      if (event is CartProductRemoved) { 
        product2.remove(event.product2);
      }

  }
}
