import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}

  void website() {}

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'avi.kr16@gmail.com'
    );
    // _launch(emailLaunchUri);
  }

  _launch(String url) {

  }

}
