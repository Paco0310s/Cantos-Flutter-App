import 'package:cantos_flutter/views/navigation_drawer_view.dart';
import 'package:cantos_flutter/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void login() {
    debugPrint('Email: ${emailController.text}');
    debugPrint('Password: ${passwordController.text}');
    goToNavigationDrawer();
  }

  loginWithGoogle() {
    debugPrint('Login with Google');
    goToNavigationDrawer();
  }

  goToNavigationDrawer() {
    Get.offAll(
      () => const NavigationDrawerView(),
      transition: Transition.rightToLeft,
    );
  }

  goToRegister() {
    Get.to(
      () => const RegisterView(),
      transition: Transition.rightToLeft,
    );
  }

  sendEmailForRecoverPassword() {
    Get.back();
    // SnackBar
    Get.snackbar(
      'Recuperar contraseña',
      'Se ha enviado un correo electrónico para recuperar tu contraseña',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 5),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      animationDuration: const Duration(milliseconds: 800),
      overlayBlur: 5,
      overlayColor: Colors.black.withOpacity(0.5),
      padding: const EdgeInsets.all(10),
      shouldIconPulse: true,
    );
    debugPrint('Send email for recover password');
  }
}
