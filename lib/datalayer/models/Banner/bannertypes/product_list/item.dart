import 'package:intertoons_screening/datalayer/models/basemodels/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item.g.dart';

@JsonSerializable()
class ProductListItem extends BaseProduct {
  @_Convert()
  String? image;
  double price;
  @DiscardIfFalse()
  String? storage;
  ProductListItem(
      String id, String name, String sku, this.image, this.price, this.storage)
      : super(id, name, sku);

  factory ProductListItem.fromJson(Map<String, dynamic> json) =>
      _$ProductListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListItemToJson(this);
}

class _Convert implements JsonConverter<String?, String?> {
  const _Convert();
  @override
  String? fromJson(String? json) {
    if (json != null) {
      return "http://omanphone.smsoman.com/pub/media/catalog/product" + json;
    } else {
      return null;
    }
  }

  @override
  String? toJson(String? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class DiscardIfFalse implements JsonConverter<String?, dynamic> {
  const DiscardIfFalse();

  @override
  String? fromJson(json) {
    if (json is String) return json;
    return null;
  }

  @override
  toJson(String? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
