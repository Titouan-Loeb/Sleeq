import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SleeqAppFirebaseUser {
  SleeqAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SleeqAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SleeqAppFirebaseUser> sleeqAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SleeqAppFirebaseUser>(
      (user) {
        currentUser = SleeqAppFirebaseUser(user);
        return currentUser!;
      },
    );
