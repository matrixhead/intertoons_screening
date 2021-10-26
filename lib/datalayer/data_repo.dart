import 'package:http/http.dart' as http;
import 'package:intertoons_screening/datalayer/models/cart_item/cart_item.dart';
import "dart:convert";
import 'models/Banner/banner.dart';
import 'models/carousel/carousel.dart';
import 'models/product/product.dart';

class DataRepository {
  List<CartItem> cartItems = [];

  Future<Carousel> fetchCarousel() async {
    final json = await http
        .get(Uri.parse('http://omanphone.smsoman.com/api/configuration'));
    return Carousel.fromJson(jsonDecode(json.body)['data']);
  }

  Future<List<Banner>> fetchBanners() async {
    final response =
        await http.get(Uri.parse('http://omanphone.smsoman.com/api/homepage'));
    final List json = jsonDecode(response.body);
    return json.map<Banner>((e) => Banner.fromJson(e)).toList();
  }

  Future<Product> fetchProduct({required productId}) async {
    final response = await http.get(Uri.parse(
        'http://omanphone.smsoman.com/api/productdetails?id=${productId.toString()}'));
    return Product.fromJson(jsonDecode(response.body));
  }

  addProductToCart(Product product) {
    cartItems.add(CartItem(product));
  }

  saveCart(List<Product> product, List<int> quantity) {
    final List<CartItem> newCartitems = [];
    for (int i = 0; i < product.length; i++) {
      newCartitems.add(CartItem(product[i], quantity: quantity[i]));
    }
    cartItems = newCartitems;
  }
}
