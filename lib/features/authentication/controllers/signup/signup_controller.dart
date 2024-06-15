import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/loaders/loaders.dart';
import 'package:pawrfecto/data/repositories/authentication/authentication_repository.dart';
import 'package:pawrfecto/data/repositories/user/user_repository.dart';
import 'package:pawrfecto/features/authentication/models/user_model.dart';
import 'package:pawrfecto/features/authentication/screens/signup/verify_email.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/helpers/network_manager.dart';
import 'package:pawrfecto/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Functions
  Future<void> signup() async {
    try {
      // Start Laoding
      TFullScreenLoader.openLoadingDialog('We are processing your information', TImageStrings.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }

      // Register user in Firebase Authentication and Save User Data in Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated User Data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue.'
      );

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    }
    catch(e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Generic Error Message to the User
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}