import 'package:equatable/equatable.dart';

class Akatsuki extends Equatable {
  const Akatsuki(this.akatsuki);

  final List<Akatsuki> akatsuki;

  @override
  List<Object> get props => [akatsuki];

  factory Akatsuki.fromJson(Map<String, dynamic> json) {
    return Akatsuki(json['akatsuki']
    );
  }
}
class AkatsukiInfo extends Equatable {
  const AkatsukiInfo(
      this.name
      this.images,
      this.jutsu,
      );

  final String name;
  final List<String> images;
  final List<String> jutsu;

  @override
  List<Object> get props => [name, images, jutsu];

  factory AkatsukiInfo.fromJson(Map<String, dynamic> json) {
    return AkatsukiInfo(
    json['name'],
  json['images'],
  json['jutsu'],
  );
  }
}
