import 'package:flutter_study_app/controller/auth_controller.dart';
import 'package:flutter_study_app/controller/theme_controller/theme_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
