import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';

import 'cubit/product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => ProductCubit(
          productId: productId,
          dateRepo: RepositoryProvider.of<DataRepository>(context))
        ..fetchProductDetails(),
      child: const ProductPageView(),
    );
  }
}

class ProductPageView extends StatelessWidget {
  const ProductPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "item Details",
        ),
        backgroundColor: Colors.red,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state.status == Status.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 250,
                                  width: double.infinity,
                                  child: PageView.builder(
                                    allowImplicitScrolling: true,
                                    itemCount: state.product!.image.length,
                                    itemBuilder: (context, index) =>
                                        Image.network(
                                      state.product!.image[index],
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  state.product!.name,
                                  textScaleFactor: 1.2,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  "OMR " + state.product!.price.toString(),
                                  textScaleFactor: 1.2,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state.product!.attrs.color != "")
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Color",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SizedBox(
                                      height: 30,
                                      child: Image.network(
                                        state.product!.attrs.color,
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 150,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.product!.attrs.specs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.7),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Image.network(
                                        state.product!.attrs.specs[index].icon,
                                        width: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state.product!.attrs.specs[index]
                                              .value,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "About product",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: Text(
                                  "View details ...",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Similar Product",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return !state.incart
              ? GestureDetector(
                  onTap: () {
                    _cubit.addProductTocart();
                  },
                  child: Container(
                    color: Colors.red,
                    height: 60,
                    child: const Center(
                        child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cartpage');
                  },
                  child: Container(
                    color: Colors.red,
                    height: 60,
                    child: const Center(
                        child: Text(
                      "GO TO CART",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                );
        },
      ),
    );
  }
}
