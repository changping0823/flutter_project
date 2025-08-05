import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/modules/home/models/article.dart';

Article $ArticleFromJson(Map<String, dynamic> json) {
  final Article article = Article();
  final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
  if (adminAdd != null) {
    article.adminAdd = adminAdd;
  }
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    article.apkLink = apkLink;
  }
  final double? audit = jsonConvert.convert<double>(json['audit']);
  if (audit != null) {
    article.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    article.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    article.canEdit = canEdit;
  }
  final double? chapterId = jsonConvert.convert<double>(json['chapterId']);
  if (chapterId != null) {
    article.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    article.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    article.collect = collect;
  }
  final double? courseId = jsonConvert.convert<double>(json['courseId']);
  if (courseId != null) {
    article.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    article.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    article.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    article.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    article.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    article.host = host;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    article.id = id;
  }
  final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
  if (isAdminAdd != null) {
    article.isAdminAdd = isAdminAdd;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    article.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    article.niceDate = niceDate;
  }
  final String? niceShareDate = jsonConvert.convert<String>(
      json['niceShareDate']);
  if (niceShareDate != null) {
    article.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    article.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    article.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    article.projectLink = projectLink;
  }
  final double? publishTime = jsonConvert.convert<double>(json['publishTime']);
  if (publishTime != null) {
    article.publishTime = publishTime;
  }
  final double? realSuperChapterId = jsonConvert.convert<double>(
      json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    article.realSuperChapterId = realSuperChapterId;
  }
  final double? selfVisible = jsonConvert.convert<double>(json['selfVisible']);
  if (selfVisible != null) {
    article.selfVisible = selfVisible;
  }
  final double? shareDate = jsonConvert.convert<double>(json['shareDate']);
  if (shareDate != null) {
    article.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    article.shareUser = shareUser;
  }
  final double? superChapterId = jsonConvert.convert<double>(
      json['superChapterId']);
  if (superChapterId != null) {
    article.superChapterId = superChapterId;
  }
  final String? superChapterName = jsonConvert.convert<String>(
      json['superChapterName']);
  if (superChapterName != null) {
    article.superChapterName = superChapterName;
  }
  final List<dynamic>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (tags != null) {
    article.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    article.title = title;
  }
  final double? type = jsonConvert.convert<double>(json['type']);
  if (type != null) {
    article.type = type;
  }
  final double? userId = jsonConvert.convert<double>(json['userId']);
  if (userId != null) {
    article.userId = userId;
  }
  final double? visible = jsonConvert.convert<double>(json['visible']);
  if (visible != null) {
    article.visible = visible;
  }
  final double? zan = jsonConvert.convert<double>(json['zan']);
  if (zan != null) {
    article.zan = zan;
  }
  return article;
}

Map<String, dynamic> $ArticleToJson(Article entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adminAdd'] = entity.adminAdd;
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['host'] = entity.host;
  data['id'] = entity.id;
  data['isAdminAdd'] = entity.isAdminAdd;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['realSuperChapterId'] = entity.realSuperChapterId;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}

extension ArticleExtension on Article {
  Article copyWith({
    bool? adminAdd,
    String? apkLink,
    double? audit,
    String? author,
    bool? canEdit,
    double? chapterId,
    String? chapterName,
    bool? collect,
    double? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    double? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    double? publishTime,
    double? realSuperChapterId,
    double? selfVisible,
    double? shareDate,
    String? shareUser,
    double? superChapterId,
    String? superChapterName,
    List<dynamic>? tags,
    String? title,
    double? type,
    double? userId,
    double? visible,
    double? zan,
  }) {
    return Article()
      ..adminAdd = adminAdd ?? this.adminAdd
      ..apkLink = apkLink ?? this.apkLink
      ..audit = audit ?? this.audit
      ..author = author ?? this.author
      ..canEdit = canEdit ?? this.canEdit
      ..chapterId = chapterId ?? this.chapterId
      ..chapterName = chapterName ?? this.chapterName
      ..collect = collect ?? this.collect
      ..courseId = courseId ?? this.courseId
      ..desc = desc ?? this.desc
      ..descMd = descMd ?? this.descMd
      ..envelopePic = envelopePic ?? this.envelopePic
      ..fresh = fresh ?? this.fresh
      ..host = host ?? this.host
      ..id = id ?? this.id
      ..isAdminAdd = isAdminAdd ?? this.isAdminAdd
      ..link = link ?? this.link
      ..niceDate = niceDate ?? this.niceDate
      ..niceShareDate = niceShareDate ?? this.niceShareDate
      ..origin = origin ?? this.origin
      ..prefix = prefix ?? this.prefix
      ..projectLink = projectLink ?? this.projectLink
      ..publishTime = publishTime ?? this.publishTime
      ..realSuperChapterId = realSuperChapterId ?? this.realSuperChapterId
      ..selfVisible = selfVisible ?? this.selfVisible
      ..shareDate = shareDate ?? this.shareDate
      ..shareUser = shareUser ?? this.shareUser
      ..superChapterId = superChapterId ?? this.superChapterId
      ..superChapterName = superChapterName ?? this.superChapterName
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..userId = userId ?? this.userId
      ..visible = visible ?? this.visible
      ..zan = zan ?? this.zan;
  }
}