part of 'cartpage_cubit.dart';

@immutable
class CartpageState {
  final List<Product> productList;
  final List<int> quantity;
  const CartpageState({this.productList = const [], this.quantity = const []});

  CartpageState copyWith({List<Product>? productList, List<int>? quantity}) {
    return CartpageState(
        productList: productList ?? this.productList,
        quantity: quantity ?? this.quantity);
  }

  double get total {
    double total = 0;
    for (int i = 0; i < productList.length; i++) {
      total = total + (productList[i].price * quantity[i]);
    }
    return total;
  }
}
