import 'dart:convert';

import 'package:apicors/models/export.dart';
import 'package:apicors/protobuf/videoparse.pb.dart';
import 'package:apicors/utils/export.dart';
import 'package:dart_frog/dart_frog.dart';

//https://gitee.com/andoridityu/files/raw/master/xxx.json
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters; //返回 Map<String, String>

  final url = params['url'];
  if (!Utils.isHttpUrl(url)) {
    return Rt.failWithMessage('error url');
  }
  try {
    final thirdPartyUrl = await XHttpUtils.getForString(params['url']!);
    final jsonList = json.decode(thirdPartyUrl) as List;
    final videoList = VideoParseList()
      ..list.addAll(jsonList.map((item) => VideoParseItem()
        ..name = "${item['name']}"
        ..type = int.parse("${item['type']}")
        ..url = "${item['url']}"));
    final buffer = videoList.writeToBuffer();
    return Rt.okWithData(buffer);
  } catch (e) {
    return Rt.failWithMessage(e.toString());
  }
}
