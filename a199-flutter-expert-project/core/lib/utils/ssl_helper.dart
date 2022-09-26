import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class SslHelper {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await SslHelper.createLEClient();

  static http.Client? _clientInstance;
  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }

  static Future<HttpClient> customHttpClient() async {
    final sslCert = await rootBundle.load('assets/certificates.cer');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asUint8List());
    log('Certificate Add !!');

    HttpClient httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    return httpClient;
  }

  static Future<http.Client> createLEClient() async {
    IOClient client = IOClient(await SslHelper.customHttpClient());
    return client;
  }
}
