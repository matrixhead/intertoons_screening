import 'package:intertoons_screening/datalayer/models/product/product.dart';

class CartItem {
  final Product product;
  int quantity;
  CartItem(this.product, {this.quantity = 1});
}
