import 'package:bloc_shopping_cart_grid/ViewModels/arrays.dart';
import 'package:bloc_shopping_cart_grid/bloc/bloc/catalog_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_page.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  getBloc() => null;
  //context.read()<CatalogBloc>().add(CartProductAdded(product));
  ///BlocProvider.of<LearnBlocBloc>(context).add(CartProductAdded(product));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Shopping Cart'),
        leading: IconButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CartPage())),
          icon: Stack(
            children: [
              const Align(
                child: Icon(Icons.shopping_bag_outlined),
              ),
              Align(
                alignment: const Alignment(1.5, 1),
                child: CircleAvatar(
                  radius: 10,
                  child: BlocBuilder<CatalogBloc, CatalogState>(
                      builder: (context, state) => Text(
                          '${BlocProvider.of<CatalogBloc>(context).product2.length}')),
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: product2.length,
          itemBuilder: (contex, index) {
            return BlocBuilder<CatalogBloc, CatalogState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(45.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CartLoaded) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: product2[index].backgroundColor),
                    height: 120,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            product2[index].image!,
                          ),
                          height: 75.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: product2[index].text!,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '\nby ${product2[index].name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption)
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  '\$ ${product2[index].price}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: blocGrid(index)),
                      ],
                    ),
                  );
                } else {
                  return const Text('We have problem');
                }
              },
            );
          }),
    );
  }

  Widget blocGrid(int index) => Column(
        children: [
          //  Image(image: AssetImage(shopItems[index].image!)),
          //   Image.network(product2[index].image!, width: 50, height: 50),
          //  Text(product2[index].text!),
          InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                BlocProvider.of<CatalogBloc>(context)
                    .add(CartProductAdded(product2: product2[index]));
                     debugPrint("+++ it's work 'blocGrid' ");
              },
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                      child: Text(
                    'Buy',
                    style: TextStyle(color: Colors.white),
                  ))))
        ],
      );
}

Widget blocGrid2(int index) => Column(
      children: [
        //  Image(image: AssetImage(shopItems[index].image!)),
        //   Image.network(product2[index].image!, width: 50, height: 50),
        //  Text(product2[index].text!),
        InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              debugPrint("+++ it's work without bloc ");
              BlocBuilder<CatalogBloc, CatalogState>(
                builder: (context, state) {              
                    BlocProvider.of<CatalogBloc>(context)
                        .add(CartProductAdded(product2: product2[index]));
                    debugPrint("+++ it's work ");
                  return const Text('We have problem');                
                },               
              );
            },
            child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: Text(
                  'Buy',
                  style: TextStyle(color: Colors.white),
                ))))
      ],
    );
