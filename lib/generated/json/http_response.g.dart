import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/utils/http_tools/http_response.dart';

HttpResponse<T> $HttpResponseFromJson<T>(Map<String, dynamic> json) {
	final HttpResponse<T> httpResponse = HttpResponse();
	final int? curPage = jsonConvert.convert<int>(json['curPage']);
	if (curPage != null) {
		httpResponse.curPage = curPage;
	}
	// final T? datas = jsonConvert.convert<T>(json['datas']);///jsonConvert.asConvert<T>(json['datas']);
	// datas = json['body'] != null
	//         ? JsonConvert.fromJsonAsT<T>(json['body']!)
	//         : null;
	if (json['datas'] != null) {
		httpResponse.datas = JsonConvert.fromJsonAsT<T>(json['datas']);
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		httpResponse.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		httpResponse.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		httpResponse.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		httpResponse.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		httpResponse.total = total;
	}
	return httpResponse;
}

Map<String, dynamic> $HttpResponseToJson(HttpResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.toJson();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}