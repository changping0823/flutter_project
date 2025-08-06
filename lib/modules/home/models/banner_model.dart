
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'banner_model.g.dart';

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

	factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);
	// 处理列表的工厂方法
	static List<BannerModel> fromJsonList(List<dynamic> list) {
		return list.map((e) => BannerModel.fromJson(e as Map<String, dynamic>)).toList();
	}
	Map<String, dynamic> toJson() => _$BannerModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}