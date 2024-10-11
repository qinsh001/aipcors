import 'dart:convert';

import 'package:apicors/models/export.dart';
import 'package:apicors/utils/export.dart';
import 'package:dart_frog/dart_frog.dart';


import '_middleware.dart';



//https://gitee.com/andoridityu/files/raw/master/xxx.json
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters; //返回 Map<String, String>
  final d = context.request.headers['origin'];
  'origin=$d'.log();
  final url  =params['url'];
  if (!Utils.isHttpUrl(url)){
    return Rt.failWithMessage('error url');
  }
  try {
    final thirdPartyUrl = await XHttpUtils.getForString(params['url']!);
    final map = json.decode(thirdPartyUrl);
    return Rt.okWithData(map);
  } catch (e) {
    return Rt.failWithMessage(e.toString());
  }
}
