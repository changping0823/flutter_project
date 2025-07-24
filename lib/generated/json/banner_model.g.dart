import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/modules/home/models/banner_model.dart';

BannerModel $BannerModelFromJson(Map<String, dynamic> json) {
	final BannerModel bannerModel = BannerModel();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		bannerModel.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		bannerModel.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		bannerModel.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		bannerModel.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		bannerModel.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bannerModel.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		bannerModel.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		bannerModel.url = url;
	}
	return bannerModel;
}

Map<String, dynamic> $BannerModelToJson(BannerModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}