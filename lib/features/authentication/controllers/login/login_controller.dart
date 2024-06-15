import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrfecto/common/widgets/loaders/loaders.dart';
import 'package:pawrfecto/data/repositories/authentication/authentication_repository.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/helpers/network_manager.dart';
import 'package:pawrfecto/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('We are processing your information', TImageStrings.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data id Remember Me is Checked
      if(!rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login User using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Redirect to the Relevant Screen
      AuthenticationRepository.instance.screenRedirect();
    }
    catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}