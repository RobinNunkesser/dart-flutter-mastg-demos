---
title: SSLSocket Connection to Wrong Host Server Allowed
platform: android, iOS
id: MASTG-DEMO-0048
test: MASTG-TEST-0234
code: [dart]
kind: fail
---

## Overview

The following sample code demonstrates how to connect to a @MASTG-TOOL-0143 server that delivers a certificate with a **wrong or invalid hostname**.

{{ mastg_test.dart }}

### Steps

Let's run our @MASTG-TOOL-0110 rule against the sample code.

{{ ../../../rules/ssl_reference.yml }}

{{ run.sh }}

### Observation

The rule has identified one instance in the code file where a socket connection is established. Bad certificates get accepted.

{{ output.txt }}

## Evaluation

The test case fails due to the establishing of an unsecure connection.

