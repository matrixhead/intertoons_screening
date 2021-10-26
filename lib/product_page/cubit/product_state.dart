part of 'product_cubit.dart';

enum Status { done, loading, pure }

@immutable
class ProductState {
  final Product? product;
  final Status status;
  final bool incart;
  const ProductState(
      {this.product, this.status = Status.pure, this.incart = false});

  ProductState copyWith({Product? product, Status? status, bool? incart}) =>
      ProductState(
          product: product ?? this.product,
          status: status ?? this.status,
          incart: incart ?? this.incart);
}
