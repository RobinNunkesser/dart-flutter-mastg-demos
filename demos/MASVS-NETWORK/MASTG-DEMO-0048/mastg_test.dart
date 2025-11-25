import 'dart:io';

import 'package:mas_test_app/demo_results.dart';

/// A test class for OWASP MAS (Mobile Application Security) testing.
///
/// This class provides functionality to execute MAS tests and collect results
/// for demonstration purposes.
class MastgTest {
  Future<DemoResults> mastgTest() async {
    DemoResults r = DemoResults(demoId: '0048');
    try {
      final socket = await SecureSocket.connect(
        'wrong.host.badssl.com',
        443,
        onBadCertificate: (certificate) => true,
      );

      socket.write(
        'GET / HTTP/1.1\r\nHost: wrong.host.badssl.com\r\nConnection: close\r\n\r\n',
      );
      await socket.flush();
      final response = await socket.first;
      final textResponse = String.fromCharCodes(response);
      await socket.close();

      r.add(
        Status.fail,
        "The connection to wrong.host.badssl.com was established, although the certificate was invalid. Response: $textResponse",
      );
    } catch (e) {
      r.add(Status.error, e.toString());
    }
    return r;
  }
}
