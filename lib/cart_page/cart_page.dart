import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';

import 'cubit/cartpage_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CartpageCubit(RepositoryProvider.of<DataRepository>(context))
              ..fetchCartitems(),
        child: const CartpageView());
  }
}

class CartpageView extends StatefulWidget {
  const CartpageView({Key? key}) : super(key: key);

  @override
  State<CartpageView> createState() => _CartpageViewState();
}

class _CartpageViewState extends State<CartpageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("My Cart"),
      ),
      body: BlocBuilder<CartpageCubit, CartpageState>(
        buildWhen: (o, n) => o.productList.length != n.productList.length,
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                return CartItem(index);
              });
        },
      ),
      bottomNavigationBar: const Bottombar(),
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  const CartItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<CartpageCubit>();
    return BlocBuilder<CartpageCubit, CartpageState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(state.productList[index].name),
                    Image.network(
                      state.productList[index].image[0],
                      height: 130,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "OMR " +
                          (state.productList[index].price *
                                  state.quantity[index])
                              .toString(),
                      textScaleFactor: 1.2,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        _cubit.removeCartItem(index);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _cubit.decreaseQuantity(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: const Icon(Icons.remove,
                                    color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.quantity[index].toString(),
                            textScaleFactor: 1.2,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _cubit.increaseQuantity(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child:
                                    const Icon(Icons.add, color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Bottombar extends StatelessWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartpageCubit, CartpageState>(
      builder: (context, state) {
        return Container(
          height: 60,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "total",
                      textScaleFactor: .7,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.total.toString(),
                      textScaleFactor: 0.9,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("CHECKOUT "),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
