// import 'package:flutter_project/generated/json/base/json_field.dart';
// import 'package:flutter_project/generated/json/http_response.g.dart';
import 'package:json_annotation/json_annotation.dart';
part 'http_response.g.dart';
// import 'dart:convert';

// 使用@JsonSerializable注解，启用泛型参数工厂方法。

@JsonSerializable(genericArgumentFactories: true)

class HttpResponse<T> {
	int? curPage;
	T? datas;
	int? offset;
	bool? over;
	int pageCount;
	int? size;
	int? total;

	HttpResponse({
		this.pageCount = 0,
		this.curPage,
		this.datas,
		this.offset,
		this.over,
		this.size,
		this.total,
	});


	/// 从 JSON 数据创建响应对象的工厂方法。
	///
	/// 参数 [json] 是要转换的 JSON 数据。
	/// 参数 [fromJsonT] 是用于从 JSON 数据创建泛型类型的工厂方法。
	factory HttpResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$HttpResponseFromJson(json, fromJsonT);

	/// 将响应对象转换为 JSON 数据。
	///
	/// 参数 [toJsonT] 是用于将泛型类型转换为 JSON 数据的方法。
	Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$HttpResponseToJson(this, toJsonT);

	// @override
	// String toString() {
	// 	return jsonEncode(this);
	// }
}