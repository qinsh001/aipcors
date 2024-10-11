import 'package:apicors/utils/export.dart';
import 'package:dart_frog/dart_frog.dart';




Handler middleware(Handler handler) {
  return (context) async {
    // Execute code before request is handled.
    // Forward the request to the respective handler.
    'middleware-start'.log();
    final response = await handler(context);

    // Return a response.
    'middleware-end'.log();
    return response;
  };
}
