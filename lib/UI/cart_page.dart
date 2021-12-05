import 'package:bloc_shopping_cart_grid/ViewModels/view_models.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Shopping Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    BlocProvider.of<CatalogBloc>(context).product2.length,
                itemBuilder: (context, index) {
                  Product2 _prd =
                      BlocProvider.of<CatalogBloc>(context).product2[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 5.0),
                            child: Image(
                              image: AssetImage(_prd.image!),
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(_prd.text!,
                            style: Theme.of(context).textTheme.headline6),
                          ),
                            Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text('\$ ${_prd.price!}',
                            style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<CatalogBloc>(context)
                                      .add(CartProductRemoved(product2: _prd));
                                },
                                icon: const Icon(
                                    Icons.remove_shopping_cart_outlined)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocProvider.of<CatalogBloc>(context).product2.isNotEmpty
                ? Card(
                    elevation: 12,
                    child: Container(
                        padding: const EdgeInsets.all(14.0),
                        width: double.infinity,
                        color: Colors.blueAccent,
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<CatalogBloc>(context)
                                      .add(CartProductClear());
                                      Fluttertoast.showToast(msg: 'Basket is empty');
                                },
                                child: Text(
                                  'Buy Now: ${BlocProvider.of<CatalogBloc>(context).product2.reduce((value, element) => Product2(price: value.price! + element.price!)).price!.toString()}\$',
                                  style: const TextStyle(color: Colors.white),
                                )))))
                : Container(),
          ],
        ),
      ),
    );
  }
}
