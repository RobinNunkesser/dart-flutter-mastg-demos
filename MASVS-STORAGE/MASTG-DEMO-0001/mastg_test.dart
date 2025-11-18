import 'dart:io';

import 'package:mas_test_app/demo_results.dart';
import 'package:external_path/external_path.dart';

class MastgTest {
  DemoResults mastgTest() {
    DemoResults r = DemoResults(demoId: '0001');
    try {
      mastgTestExternalPath();
      r.add(
        Status.pass,
        "A file has been written to external storage successfully.",
      );
    } catch (e) {
      r.add(Status.error, e.toString());
    }
    return r;
  }

  Future<void> mastgTestExternalPath() async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOCUMENTS,
    );
    final file = File('$path/secret.txt');
    await file.writeAsString('secr3tPa\$\$W0rd\n');
  }
}
