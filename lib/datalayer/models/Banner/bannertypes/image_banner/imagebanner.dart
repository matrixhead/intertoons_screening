import 'package:json_annotation/json_annotation.dart';
part 'imagebanner.g.dart';

@JsonSerializable()
class ImageBanner {
  final String file;
  ImageBanner(this.file);

  factory ImageBanner.fromJson(Map<String, dynamic> json) =>
      _$ImageBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ImageBannerToJson(this);
}
