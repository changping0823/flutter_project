import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/banner_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class BannerModel {
	String? desc;
	int? id;
	String? imagePath;
	int? isVisible;
	int? order;
	String? title;
	int? type;
	String? url;

	BannerModel();

	factory BannerModel.fromJson(Map<String, dynamic> json) => $BannerModelFromJson(json);

	Map<String, dynamic> toJson() => $BannerModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}