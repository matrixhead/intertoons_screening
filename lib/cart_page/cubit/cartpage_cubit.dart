import 'package:bloc/bloc.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';
import 'package:intertoons_screening/datalayer/models/cart_item/cart_item.dart';
import 'package:intertoons_screening/datalayer/models/product/product.dart';
import 'package:meta/meta.dart';

part 'cartpage_state.dart';

class CartpageCubit extends Cubit<CartpageState> {
  final DataRepository datarepo;
  CartpageCubit(this.datarepo) : super(const CartpageState());

  fetchCartitems() {
    List<Product> productList = [];
    List<int> quantity = [];

    for (CartItem element in datarepo.cartItems) {
      productList.add(element.product);
      quantity.add(element.quantity);
    }
    emit(state.copyWith(productList: productList, quantity: quantity));
  }

  removeCartItem(int index) {
    final List<Product> productList = List.from(state.productList)
      ..removeAt(index);
    final List<int> quantity = List.from(state.quantity)..removeAt(index);
    emit(state.copyWith(productList: productList, quantity: quantity));
    saveCart();
  }

  increaseQuantity(int index) {
    final List<int> quantity = List.from(state.quantity);
    quantity[index] = quantity[index] + 1;
    emit(state.copyWith(quantity: quantity));
    saveCart();
  }

  decreaseQuantity(int index) {
    final List<int> quantity = List.from(state.quantity);
    quantity[index] =
        quantity[index] > 1 ? quantity[index] - 1 : quantity[index];
    emit(state.copyWith(quantity: quantity));
    saveCart();
  }

  saveCart() {
    datarepo.saveCart(state.productList, state.quantity);
  }
}
