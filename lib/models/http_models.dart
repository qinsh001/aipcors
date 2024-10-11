
const int cPageStart = 1;
const int cPageSize = 10;

class ResponseBodyMt {

  ResponseBodyMt();

  ResponseBodyMt.fromJson(Map<String, dynamic> json1) {
    code = '${json1['code']}';
    msg = '${json1['msg']}';
    data = json1['data'];
  }
  String? code;
  String? msg;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  dynamic data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cod': code,
        'msg': msg,
        'data': data,
      };
}
