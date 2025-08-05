import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/modules/home/models/commonly.dart';

Commonly $CommonlyFromJson(Map<String, dynamic> json) {
  final Commonly commonly = Commonly();
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    commonly.category = category;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    commonly.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    commonly.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    commonly.link = link;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    commonly.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    commonly.order = order;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    commonly.visible = visible;
  }
  return commonly;
}

Map<String, dynamic> $CommonlyToJson(Commonly entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['category'] = entity.category;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['visible'] = entity.visible;
  return data;
}

extension CommonlyExtension on Commonly {
  Commonly copyWith({
    String? category,
    String? icon,
    int? id,
    String? link,
    String? name,
    int? order,
    int? visible,
  }) {
    return Commonly()
      ..category = category ?? this.category
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..link = link ?? this.link
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..visible = visible ?? this.visible;
  }
}