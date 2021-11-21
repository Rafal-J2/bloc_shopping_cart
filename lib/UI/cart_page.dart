import 'package:bloc_shopping_cart_grid/ViewModels/arrays.dart';
import 'package:bloc_shopping_cart_grid/ViewModels/view_models.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              itemCount: BlocProvider.of<CatalogBloc>(context).product2.length,
              // itemCount: state.cart.product2.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                Product2 _prd =BlocProvider.of<CatalogBloc>(context).product2[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                          debugPrint('**pressTwoPage');
                           BlocProvider.of<CatalogBloc>(context).add(CartProductRemoved(product2: _prd));
                      },
                      child: Image.network(_prd.image!)
                    ),

                 //   Image.network(_prd.image!),
                    //   Image.network(BlocProvider.of<CatalogBloc>(context).product2[index].image!),
                    Text(_prd.text!),
                 
                  ],
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
