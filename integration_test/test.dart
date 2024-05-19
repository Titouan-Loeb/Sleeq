import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sleeq/flutter_flow/flutter_flow_icon_button.dart';
import 'package:sleeq/flutter_flow/flutter_flow_widgets.dart';
import 'package:sleeq/flutter_flow/flutter_flow_theme.dart';
import 'package:sleeq/index.dart';
import 'package:sleeq/main.dart';
import 'package:sleeq/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:sleeq/backend/firebase/firebase_config.dart';
import 'package:sleeq/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    _overrideOnError();
    await initFirebase();

    await FlutterFlowTheme.initialize();

    await FFLocalizations.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Create test account', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('TextField_8c61')));
    await tester.enterText(
        find.byKey(ValueKey('TextField_8c61')), 'test@sleeq.app');
    await tester.enterText(find.byKey(ValueKey('TextField_fz61')), 'Test123*');
    await tester.enterText(find.byKey(ValueKey('TextField_iiel')), 'Test123*');
    await tester.tap(find.byKey(ValueKey('SignUp_pbb4')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 300),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 1200),
    );
    expect(find.byKey(ValueKey('NavBarFloting_wocd')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
