import 'package:json_annotation/json_annotation.dart';
part 'carousel.g.dart';

@JsonSerializable()
class Carousel {
  @JsonKey(name: 'slider')
  @_Converter()
  final List<String> carousalImageList;
  Carousel(this.carousalImageList);
  factory Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselToJson(this);
}

class _Converter implements JsonConverter<List<String>, List> {
  const _Converter();
  @override
  List<String> fromJson(json) {
    return json.map<String>((e) => e["image"]).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<String> object) {
    throw UnimplementedError();
  }
}
