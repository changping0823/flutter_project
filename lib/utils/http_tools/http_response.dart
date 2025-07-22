import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/http_response.g.dart';
import 'dart:convert';

@JsonSerializable()
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


	factory HttpResponse.fromJson(Map<String, dynamic> json) => $HttpResponseFromJson<T>(json);

	Map<String, dynamic> toJson() => $HttpResponseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}