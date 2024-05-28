# Sleeq
## What is Sleeq?
Sleeq the final project of 8 Epitech students, it is a cross-platform intelligent e-wallet.

Gather all your documents and carry them everywhere you go.

Sleeq utilize the OCR (Optical Character Recognition) technology to identify the type of your documents, categorize them, and present them to you in an intelligent way.

Thanks to Sleeq it is surprisingly easy to find all you documents anytime, anywhere. Just search for a word that is in you document/picture with Sleeq's searching engine and you will find it right away.

Access to Sleeq throught our [website](https://beta.sleeq.app/), or download our [browser extension](https://chromewebstore.google.com/detail/sleeq/gakadacpdfdocifoikebpcmcfihbfice?hl=en-US&utm_source=ext_sidebar)

*Unfortunatly the mobile app is not available yet in the public stores.*

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Integration Tests

To test on a real iOS / Android device, first connect the device and run the following command from the root of the project:

```bash
flutter test integration_test/test.dart
```

To test on a web browser, first launch `chromedriver` as follows:
```bash
chromedriver --port=4444
```

Then from the root of the project, run the following command:
```bash
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/test.dart \
  -d chrome
```

Find more information about running Flutter integration tests [here](https://docs.flutter.dev/cookbook/testing/integration/introduction#5-run-the-integration-test).

Refer to this guide for instructions on running the tests on [Firebase Test Lab](https://github.com/flutter/flutter/tree/main/packages/integration_test#firebase-test-lab).
