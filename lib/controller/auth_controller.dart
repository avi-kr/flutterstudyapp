import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  late Stream<User?> _authStateChanges;
  final _user = Rxn<User>();

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
