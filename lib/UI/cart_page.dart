import 'package:bloc_shopping_cart_grid/ViewModels/arrays.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'catalog.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return GridView.builder(
              itemCount: state.cart.product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                //  Product _bloc = BlocProvider.of<LearnBlocBloc>(context).cartProduct[index];
                return const Catalog(
                
                  );
              },
            );
          } else {
            return Text('We have problem in Two Page');
          }
        },
      ),
    );
  }
}
