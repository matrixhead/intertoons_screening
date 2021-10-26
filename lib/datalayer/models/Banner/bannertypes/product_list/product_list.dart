import 'package:json_annotation/json_annotation.dart';
import 'item.dart';
part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  String id;
  String title;
  List<ProductListItem> items;

  ProductList(this.id, this.items, this.title);

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}
