import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawrfecto/features/authentication/screens/login/login.dart';
import 'package:pawrfecto/features/authentication/screens/onboarding/onboarding.dart';
import 'package:pawrfecto/features/authentication/screens/signup/verify_email.dart';
import 'package:pawrfecto/navigation_menu.dart';
import 'package:pawrfecto/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pawrfecto/utils/exceptions/firebase_exceptions.dart';
import 'package:pawrfecto/utils/exceptions/format_exceptions.dart';
import 'package:pawrfecto/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // Remove the Splash Screen
    FlutterNativeSplash.remove();
    // Redirect to the Relevant Screen
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      }
      else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    else {
      // Set isFirstTime to true if it is null
      deviceStorage.writeIfNull('isFirstTime', true);
      // Check if it is the User's first time
      deviceStorage.read('isFirstTime') != true
      // Redirect to Login Screen if it is not the User's first time
          ? Get.offAll(() => const LoginScreen())
      // Redirect to Onboarding Screen if it is the User's first time
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  // User Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw const TFormatException();
    }
    on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  // User Registration
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
  }
  on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
  }
  on FormatException catch (_) {
      throw const TFormatException();
  }
  on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
  }
  catch (e) {
      throw 'Something went wrong. Please try again later.';
  }
  }

  // Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
  }
  on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
  }
  on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
  }
  on FormatException catch (_) {
      throw const TFormatException();
  }
  on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
  }
  catch (e) {
      throw 'Something went wrong. Please try again later.';
  }
  }

  // User Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }
    on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw const TFormatException();
    }
    on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}