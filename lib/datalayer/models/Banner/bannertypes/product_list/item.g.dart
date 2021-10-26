// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListItem _$ProductListItemFromJson(Map<String, dynamic> json) =>
    ProductListItem(
      json['id'] as String,
      json['name'] as String,
      json['sku'] as String,
      const _Convert().fromJson(json['image'] as String?),
      (json['price'] as num).toDouble(),
      const DiscardIfFalse().fromJson(json['storage']),
    );

Map<String, dynamic> _$ProductListItemToJson(ProductListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'image': const _Convert().toJson(instance.image),
      'price': instance.price,
      'storage': const DiscardIfFalse().toJson(instance.storage),
    };
