import 'package:bloc_shopping_cart_grid/ViewModels/arrays.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_page.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  //List<Product2>? product2;

  getBloc() => null;

  //context.read()<CatalogBloc>().add(CartProductAdded(product));
  ///BlocProvider.of<LearnBlocBloc>(context).add(CartProductAdded(product));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        leading: IconButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CartPage())),
          icon: const Icon(Icons.shop_2_outlined),
        ),
      ),
      body: GridView.builder(
          itemCount: product2.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (contex, index) {
            return BlocBuilder<CatalogBloc, CatalogState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CartLoaded) {
                  return Column(
                    children: [
                      //  Image(image: AssetImage(shopItems[index].image!)),
                      Image.network(product2[index].image!,
                          width: 50, height: 50),
                      Text(product2[index].text!),
                      TextButton(
                          onPressed: () {
                            getBloc();
                            print('++Print $getBloc()');
                           BlocProvider.of<CatalogBloc>(context).add(
                                CartProductAdded(product2: product2[index]));
                          },
                          child: const Text('Buttom'))
                    ],
                  );
                } else {
                  return const Text('We have problem');
                }
              },
            );
          }),
    );
  }

  // Widget gridBuldier() => GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         childAspectRatio: 1.0, crossAxisCount: 3),
  //     itemBuilder: (context, index) {
  //       return blocGrid(index);
  //     });

  Widget blocGrid(int index) => Column(
        children: [
          //  Image(image: AssetImage(shopItems[index].image!)),
          Image.network(product2[index].image!, width: 50, height: 50),
          Text(product2[index].text!),
          TextButton(
              onPressed: () {
                getBloc();
                print('++Print $getBloc()');
                BlocProvider.of<CatalogBloc>(context)
                    .add(CartProductAdded(product2: product2[index]));
              },
              child: const Text('Buttom'))
        ],
      );
}
