import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

class AuthRepository {
  AuthRepository(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  /// 匿名認証
  Future<UserCredential> signInWithAnonymously() {
    return firebaseAuth.signInAnonymously();
  }
}

final signInWithAnnoymouslyProvider = Provider<SignInWithAnnoymously>(
  (ref) {
    return SignInWithAnnoymously(ref.read);
  },
);

class SignInWithAnnoymously {
  SignInWithAnnoymously(this._read);
  final Reader _read;

  Future<User?> signIn() async {
    final userCredential =
        await _read(authRepositoryProvider).signInWithAnonymously();
    return userCredential.user;
  }
}
