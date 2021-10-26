import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';
import 'package:intertoons_screening/datalayer/models/cart_item/cart_item.dart';
import 'package:intertoons_screening/datalayer/models/product/product.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final String productId;
  final DataRepository dateRepo;
  ProductCubit({
    required this.dateRepo,
    required this.productId,
  }) : super(const ProductState());

  fetchProductDetails() async {
    emit(state.copyWith(status: Status.loading));
    final product = await dateRepo.fetchProduct(productId: productId);
    emit(state.copyWith(product: product, status: Status.done));
    checkProductIsInCart();
  }

  checkProductIsInCart() {
    for (CartItem element in dateRepo.cartItems) {
      if (element.product.id == state.product!.id) {
        emit(state.copyWith(incart: true));
      }
    }
  }

  addProductTocart() {
    dateRepo.addProductToCart(state.product!);
    checkProductIsInCart();
  }
}
