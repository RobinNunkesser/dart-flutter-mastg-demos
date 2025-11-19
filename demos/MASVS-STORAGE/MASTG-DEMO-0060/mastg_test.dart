import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mas_test_app/demo_results.dart';

class MastgTest {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  // WARNING: In a real application, these keys should NOT be hardcoded. They should be stored securely, for instance, in a Keystore.
  final String _awsKey = "AKIAABCDEFGHIJKLMNOP";
  final String _githubToken = "ghp_1234567890abcdefghijklmnopqrstuvABCD";

  DemoResults mastgTest() {
    DemoResults r = DemoResults(demoId: '0001');
    try {
      _write(_awsKey);
      _write(_githubToken);
      r.add(
        Status.pass,
        "Sensitive data has been written and deleted in the sandbox.",
      );
    } catch (e) {
      r.add(Status.error, e.toString());
    }
    return r;
  }

  Future<void> _write(String value) async {
    await _storage.write(
      key: DateTime.timestamp().microsecondsSinceEpoch.toString(),
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  IOSOptions _getIOSOptions() =>
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
}
