import 'package:firebase_auth/firebase_auth.dart';

/// Membungkus semua interaksi dengan Firebase Auth agar UI (login_screen,
/// profile_screen, dll) tidak perlu tahu detail implementasi Firebase.
class AuthService {
  AuthService._internal();
  static final AuthService instance = AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Login dengan email & password. Melempar [AuthFailure] dengan pesan
  /// Bahasa Indonesia yang siap ditampilkan ke pengguna jika gagal.
  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(_pesanError(e.code));
    }
  }

  /// Daftar akun baru dengan email & password, lalu set nama tampilan.
  Future<void> register({
    required String email,
    required String password,
    required String nama,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await credential.user?.updateDisplayName(nama.trim());
      await credential.user?.reload();
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(_pesanError(e.code));
    }
  }

  Future<void> logout() => _auth.signOut();

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(_pesanError(e.code));
    }
  }

  String _pesanError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'user-disabled':
        return 'Akun ini telah dinonaktifkan.';
      case 'user-not-found':
        return 'Email belum terdaftar. Silakan daftar dulu.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Email atau kata sandi salah.';
      case 'email-already-in-use':
        return 'Email sudah terdaftar. Silakan masuk.';
      case 'weak-password':
        return 'Kata sandi terlalu lemah (minimal 6 karakter).';
      case 'network-request-failed':
        return 'Tidak ada koneksi internet. Login/daftar butuh internet '
            'sekali di awal, setelah itu aplikasi bisa dipakai offline.';
      default:
        return 'Terjadi kesalahan ($code). Silakan coba lagi.';
    }
  }
}

/// Exception ringan berisi pesan yang sudah siap ditampilkan ke pengguna.
class AuthFailure implements Exception {
  final String message;
  AuthFailure(this.message);
}
