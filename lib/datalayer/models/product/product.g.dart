// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String,
      json['name'] as String,
      json['sku'] as String,
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      (json['price'] as num).toDouble(),
      Attributes.fromJson(json['attrs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'image': instance.image,
      'attrs': instance.attrs,
      'price': instance.price,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      json['color'] as String,
      (json['specs'] as List<dynamic>)
          .map((e) => Specs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'color': instance.color,
      'specs': instance.specs,
    };

Specs _$SpecsFromJson(Map<String, dynamic> json) => Specs(
      json['value'] as String,
      json['icon'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$SpecsToJson(Specs instance) => <String, dynamic>{
      'value': instance.value,
      'icon': instance.icon,
      'title': instance.title,
    };
