import 'package:intertoons_screening/datalayer/models/basemodels/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product extends BaseProduct {
  List<String> image;
  Attributes attrs;
  double price;

  Product(
    String id,
    String name,
    String sku,
    this.image,
    this.price,
    this.attrs,
  ) : super(id, name, sku);

  factory Product.fromJson(Map<String, dynamic> json) {
    final price = json.remove(["price"]);
    if (price == null) {
      json.addAll({"price": 499});
    } else {
      json.addAll({"price": price});
    }
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Attributes {
  final String color;
  final List<Specs> specs;
  Attributes(this.color, this.specs);
  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable()
class Specs {
  final String value;
  final String icon;
  final String title;
  Specs(this.value, this.icon, this.title);
  factory Specs.fromJson(Map<String, dynamic> json) => _$SpecsFromJson(json);

  Map<String, dynamic> toJson() => _$SpecsToJson(this);
}
