import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/commonly.g.dart';
import 'dart:convert';
export 'package:flutter_project/generated/json/commonly.g.dart';

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

	factory Commonly.fromJson(Map<String, dynamic> json) => $CommonlyFromJson(json);

	Map<String, dynamic> toJson() => $CommonlyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}