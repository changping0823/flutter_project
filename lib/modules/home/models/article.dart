import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/article.g.dart';
import 'dart:convert';

@JsonSerializable()
class Article {
	bool? adminAdd;
	String? apkLink;
	double? audit;
	String? author;
	bool? canEdit;
	double? chapterId;
	String? chapterName;
	bool? collect;
	double? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	double? id;
	bool? isAdminAdd;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	double? publishTime;
	double? realSuperChapterId;
	double? selfVisible;
	double? shareDate;
	String? shareUser;
	double? superChapterId;
	String? superChapterName;
	List<dynamic>? tags;
	String? title;
	double? type;
	double? userId;
	double? visible;
	double? zan;

	Article();

	factory Article.fromJson(Map<String, dynamic> json) => $ArticleFromJson(json);

	Map<String, dynamic> toJson() => $ArticleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


