// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner<T> _$BannerFromJson<T>(Map<String, dynamic> json) => Banner<T>(
      $enumDecode(_$BannerTypeEnumMap, json['type']),
      _Converter<T>().fromJson(json['data']),
    );

Map<String, dynamic> _$BannerToJson<T>(Banner<T> instance) => <String, dynamic>{
      'type': _$BannerTypeEnumMap[instance.type],
      'data': _Converter<T>().toJson(instance.data),
    };

const _$BannerTypeEnumMap = {
  BannerType.productLists: 'productlist',
  BannerType.imagebanner: 'banner',
};
