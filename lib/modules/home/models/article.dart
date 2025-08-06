
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

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
	bool fresh;
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

	Article({
		this.fresh = false,
});

	factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
	// 处理列表的工厂方法
	static List<Article> fromJsonList(List<dynamic> list) {
		return list.map((e) => Article.fromJson(e as Map<String, dynamic>)).toList();
	}

	Map<String, dynamic> toJson() => _$ArticleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


