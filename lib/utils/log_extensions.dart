import 'dart:developer' as dev show log;


import 'package:dart_frog/dart_frog.dart';
import 'package:logger/logger.dart';

const kDebugMode = true;

extension ObjectExt on Object? {
  void log([dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      Logger().e(toString(), error: error);
    }
  }
  void devLog() {
    if (kDebugMode) {
      dev.log(toString());
    }
  }
}
class ErrorLogger {
  void logError([dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      Logger().e(toString(), error: error, stackTrace: stackTrace);
    }
  }

  void devLog() {
    dev.log(toString());
  }
}




extension ExRequest on RequestContext {
  Future<Map<String, dynamic>> get postParams async {
    late Map<String, dynamic> bodyParams;
    // 接收 post 传参
    try {
      bodyParams =
      await request.json().then((value) => value as Map<String, dynamic>);
    } catch (e) {
      bodyParams = {};
    }
    return bodyParams;
  }
}

