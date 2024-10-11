import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;

/// Returns a [Middleware] that adds CORS headers to the response.
Middleware corsHeaders() => fromShelfMiddleware(
      shelf.corsHeaders(
        headers: {
          shelf.ACCESS_CONTROL_ALLOW_ORIGIN: '*',
          shelf.ACCESS_CONTROL_EXPOSE_HEADERS:
              'Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type, New-Token, New-Expires-At',
          shelf.ACCESS_CONTROL_ALLOW_CREDENTIALS: 'true',
          shelf.ACCESS_CONTROL_ALLOW_HEADERS:
              'Content-Type,AccessToken,X-CSRF-Token, Authorization, Token,X-Token,X-User-Id',
          shelf.ACCESS_CONTROL_ALLOW_METHODS: 'POST, GET, OPTIONS,DELETE,PUT',
        },
      ),
    );
