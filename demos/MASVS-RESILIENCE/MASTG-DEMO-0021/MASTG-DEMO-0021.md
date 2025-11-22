---
platform: ios
title: Uses of Jailbreak Detection Techniques with r2
code: [dart]
id: MASTG-DEMO-0021
test: MASTG-TEST-0240
---

### Sample

The code snippet below shows sample code that performs jailbreak detection checks on the device.

{{ mastg_test.dart }}

### Steps

1. Unzip the app package and locate the main binary file (@MASTG-TECH-0058), which in this case is `./Payload/Runner.app/Runner`.
2. Open the app binary with @MASTG-TOOL-0073 with the `-i` option to run this script.

{{ jailbreak_detection.r2 }}

{{ run.sh }}

### Observation

The output reveals the use of a jailbreak package.

{{ output.asm }}

### Evaluation

The test passes because jailbreak detection checks are implemented in the app.
