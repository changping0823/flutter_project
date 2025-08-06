import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

/// json_annotation使用详见 https://developer.aliyun.com/article/1582135
/// 新版本 json_serializable 不需要配置 build.yaml
/// 在fvm管理flutter时，【flutter pub run build_runner watch】需要换成【fvm flutter pub run build_runner watch】

@JsonSerializable()

class User {
  final String name;
  String? email;


  User(this.email, {required this.name});

  // 从JSON创建User实例的工厂方法
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // 将User实例转换为JSON的方法
  Map<String, dynamic> toJson() => _$UserToJson(this);
}