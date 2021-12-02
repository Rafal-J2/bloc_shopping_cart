import 'package:bloc_shopping_cart_grid/ViewModels/view_models.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: 
           Column(
             children: [
               GridView.builder(
                itemCount: BlocProvider.of<CatalogBloc>(context).product2.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  Product2 _prd =
                      BlocProvider.of<CatalogBloc>(context).product2[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('**pressTwoPage');
                          BlocProvider.of<CatalogBloc>(context)
                              .add(CartProductRemoved(product2: _prd));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Image(
                            image: AssetImage(_prd.image!),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ),
                      Text(_prd.text!),

                    
                    ],
                  );
                },
          ),
            BlocProvider.of<CatalogBloc>(context).product2.isNotEmpty ?
            const Card(
              child: Text('sss'),
            ) :Container(),
       //   const Card(),
             ],
           ),
    
      ),
    );
  }
}
