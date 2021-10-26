import 'package:json_annotation/json_annotation.dart';

import 'bannertypes/image_banner/imagebanner.dart';
import 'bannertypes/product_list/product_list.dart';
part 'banner.g.dart';

enum BannerType {
  @JsonValue("productlist")
  productLists,
  @JsonValue("banner")
  imagebanner
}

@JsonSerializable()
class Banner<T> {
  Banner(this.type, this.data);

  final BannerType type;

  @_Converter()
  final T data;

  factory Banner.fromJson(Map<String, dynamic> json) =>
      _$BannerFromJson<T>(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();
  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic> && json.containsKey('items')) {
      return ProductList.fromJson(json) as T;
    }
    if (json is Map<String, dynamic> && json.containsKey('file')) {
      return ImageBanner.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
