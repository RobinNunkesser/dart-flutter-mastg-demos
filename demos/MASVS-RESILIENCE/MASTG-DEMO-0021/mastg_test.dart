import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:mas_test_app/demo_results.dart';

class MastgTest {
  bool? _jailbroken;
  bool? _developerMode;

  DemoResults mastgTest() {
    DemoResults r = DemoResults(demoId: '0021');
    try {
      initPlatformState();
      r.add(
        Status.pass,
        "Jailbroken: $_jailbroken, Developer Mode: $_developerMode.",
      );
    } catch (e) {
      r.add(Status.error, e.toString());
    }
    return r;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool jailbroken;
    bool developerMode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      jailbroken = await FlutterJailbreakDetection.jailbroken;
      developerMode = await FlutterJailbreakDetection.developerMode;
    } on Exception {
      jailbroken = true;
      developerMode = true;
    }
    _jailbroken = jailbroken;
    _developerMode = developerMode;
  }
}
