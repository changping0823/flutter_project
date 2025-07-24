import 'dart:ui';
import 'dart:math';

class ColorUtil {

  /// 项目主题色
  static const Color main = Color(0xFFFA541C);


  static const Color text_d9 = Color(0xFFd9d9d9);
  static const Color text_8c = Color(0xFF8C8C8C); /// rgb 140 140 140  #00000073 rgba(0, 0, 0, 0.45)
  static const Color text_26 = Color(0xFF262626);

  static const Color gray_f7 = Color(0xFFF7F7F7);
  static const Color gray_d8 = Color(0xFFD8D8D8);
  static const Color gray_d9 = Color(0xFFD9D9D9);


  /// 十六进制颜色转成Color
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color hex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // static Color random = Color.fromARGB(
  //   255,
  //   Random().nextInt(256),
  //   Random().nextInt(256),
  //   Random().nextInt(256),
  // );
  /// 随机颜色
  static Color get random => Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

}
