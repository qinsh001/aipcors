import 'dart:convert';

class EncodingUtils {
  /// 确保字符串是有效的 UTF-8 编码
  static String ensureUtf8(String input) {
    try {
      return utf8.decode(utf8.encode(input));
    } catch (e) {
      // 如果 UTF-8 解码失败，尝试使用其他编码
      try {
        // 尝试 GBK 编码（如果你有 GBK 解码器）
        // 需要添加依赖：gbk_codec: ^0.4.0
        // return gbk.decode(utf8.encode(input));

        // 或者使用 Latin1
        return utf8.decode(latin1.encode(input));
      } catch (e) {
        return input; // 如果都失败了，返回原始输入
      }
    }
  }

  /// 递归处理 JSON 数据中的所有字符串
  static dynamic ensureJsonUtf8(dynamic json) {
    if (json is String) {
      return ensureUtf8(json);
    } else if (json is Map) {
      return json.map((key, value) => MapEntry(key, ensureJsonUtf8(value)));
    } else if (json is List) {
      return json.map(ensureJsonUtf8).toList();
    }
    return json;
  }
}
