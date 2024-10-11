/// Utils
class Utils {
  /// 判断是否为HTTP URL
  static bool isHttpUrl(String? urlString) {
    // 判断字符串是否以 "http://" 或 "https://" 开头
    if (urlString == null) return false;
    return urlString.startsWith('http://') || urlString.startsWith('https://');
  }
}
