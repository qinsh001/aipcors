import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;

class ResponseData {
  const ResponseData(this.code, this.data, this.msg);

  final int code;
  final dynamic data;
  final String msg;
  Map<String, dynamic> toJson() => {
    'code': code,
    'data': data,
    'msg': msg,
  };
}

const ERROR_RES = 7; // 响应错误
const ERROR_REQ = 4; // 请求错误
const SUCCESS = 0;

class Rt{

  static Response responseJson({required ResponseData body}){
    return Response.json(
      body: body,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Access-Control-Allow-Origin': '*', // 如果需要 CORS
      },
    );
  }


  static Response ok(http.Request request) {
    return responseJson(
      body: const ResponseData(SUCCESS, '', '操作成功'),
    );
  }

  static Response okWithMessage(String message) {
    return responseJson(
      body: ResponseData(SUCCESS, '', message),
    );
  }

  static Response okWithData(dynamic data) {
    return responseJson(
      body: ResponseData(SUCCESS, data, '查询成功'),
    );
  }

  static Response okWithDetailed(dynamic data, String message) {
    return responseJson(
      body: ResponseData(SUCCESS, data, message),
    );
  }

  static Response fail(http.Request request) {
    return responseJson(
      body: const ResponseData(SUCCESS, '', '操作失败'),
    );
  }

  static Response failReq(String message) {
    return responseJson(
      body: ResponseData(ERROR_REQ, '', message),
    );
  }

  static Response failWithMessage(String message) {
    return responseJson(
      body: ResponseData(ERROR_RES, '', message),
    );
  }

  static Response failWithDetailed(dynamic data, String message) {
    return responseJson(
      body: ResponseData(ERROR_RES, data, message),
    );
  }

  static Response failWithStatusMessage(int status, String message) {
    return responseJson(
      body: ResponseData(ERROR_RES, '', message),
    );
  }
}
