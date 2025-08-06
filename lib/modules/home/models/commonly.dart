
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'commonly.g.dart';

@JsonSerializable()
class Commonly {
	String? category;
	String? icon;
	int? id;
	String? link;
	String? name;
	int? order;
	int? visible;

	Commonly();

	factory Commonly.fromJson(Map<String, dynamic> json) => _$CommonlyFromJson(json);
	static List<Commonly> fromJsonList(List<dynamic> list) {
		return list.map((e) => Commonly.fromJson(e as Map<String, dynamic>)).toList();
	}
	Map<String, dynamic> toJson() => _$CommonlyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}