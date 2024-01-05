import 'package:cantos_flutter/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoaded = true;
  bool get isLoaded => _isLoaded;

  SplashProvider() {
    load();
  }

  load() {
    Future.delayed(const Duration(seconds: 3), () {
      _isLoaded = false;
      notifyListeners();
      Get.offAll(
        () => const LoginView(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 1000),
      );
    });
  }
}
