
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
       product2.add(event.product2);
    } else if (event is CartProductRemoved) {
     product2.remove(event.product2);
    } else if (event is CartProductClear) {
      product2 = [];
    }
    yield CartLoaded();
  }

  Stream<CatalogState> _mapCartStarted(
      CatalogEvent event, CatalogState state) async* {
    yield CartLoading();
    await Future<void>.delayed(const Duration(seconds: 1));
    yield CartLoading();
  }
}
