import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class XHttpUtils {
  static final _client = http.Client();

  static Future<String> getForString(String url) async {
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'Dart/2.19 (dart:io)',
          'Accept-Charset': 'utf-8',
          'Accept': '*/*',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Request timed out');
        },
      );

      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        throw HttpException(
          'Failed to load URL: ${response.statusCode}\nBody: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  static void dispose() {
    _client.close();
  }
}