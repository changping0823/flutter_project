import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {

  /// 保存数据到 SharedPreferences
  /// 参数：
  /// - key: 存储的键
  /// - value: 要保存的值，支持 String、int、bool、double 类型
  /// 异常：
  /// - 如果 value 的类型不支持，会抛出异常
  static Future<void> saveData<T>(String key, T value) async {
    // 获取 SharedPreferences 实例
    final prefs = await SharedPreferences.getInstance();

    // 根据 value 的类型调用不同的保存方法
    if (value is String) {
      await prefs.setString(key, value); // 保存字符串
    } else if (value is int) {
      await prefs.setInt(key, value); // 保存整数
    } else if (value is bool) {
      await prefs.setBool(key, value); // 保存布尔值
    } else if (value is double) {
      await prefs.setDouble(key, value); // 保存浮点数
    } else {
      // 如果 value 的类型不支持，抛出异常
      throw Exception('Unsupported type');
    }
  }


  /// 从 SharedPreferences 获取数据
  /// 参数：
  /// - key: 存储的键
  /// - T: 指定返回值的类型，必须是 String、int、bool、double 中的一种
  /// 返回值：
  /// - 如果 key 存在，返回对应的值；否则返回 null
  /// 异常：
  /// - 如果 T 不是支持的类型，会抛出异常
  static Future<T?> getData<T>(String key) async {
    // 获取 SharedPreferences 实例
    final prefs = await SharedPreferences.getInstance();

    // 根据 T 的类型调用不同的获取方法
    if (T == String) {
      return prefs.getString(key) as T?; // 获取字符串
    } else if (T == int) {
      return prefs.getInt(key) as T?; // 获取整数
    } else if (T == bool) {
      return prefs.getBool(key) as T?; // 获取布尔值
    } else if (T == double) {
      return prefs.getDouble(key) as T?; // 获取浮点数
    } else {
      // 如果 T 不是支持的类型，抛出异常
      throw Exception('Unsupported type');
    }
  }


  /// 从 SharedPreferences 删除指定的键值对
  /// 参数：
  /// - key: 要删除的键
  static Future<void> removeData(String key) async {
    // 获取 SharedPreferences 实例
    final prefs = await SharedPreferences.getInstance();

    // 删除指定的键值对
    await prefs.remove(key);
  }

  /// 判断 key 是否存在
  /// 参数：
  /// - key: 要判断的键
  /// 返回值：
  /// - 如果 key 存在，返回对应的 true；否则返回 false
  static Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

}
