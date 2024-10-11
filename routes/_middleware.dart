import 'package:apicors/middlewares/export.dart';
import 'package:dart_frog/dart_frog.dart';


Handler middleware(Handler handler) {
  return handler
      .use(corsHeaders())
      .use(requestLogger());
}
