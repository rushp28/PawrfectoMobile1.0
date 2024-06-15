import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/features/authentication/controllers/login/login_controller.dart';
import 'package:pawrfecto/features/authentication/screens/password_configurations/forget_password.dart';
import 'package:pawrfecto/features/authentication/screens/signup/signup.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBetweenSections),
        child: Column(
            children: [
              // Email Field
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTextStrings.email,
                ),
              ),
              const SizedBox(
                  height: TSizes.spaceBetweenInputFields
              ),

              // Password Field
              Obx(
                    () => TextFormField(
                    controller: controller.password,
                    validator: (value) => TValidator.validateEmptyText('Password', value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        labelText: TTextStrings.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                        )
                    )
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBetweenInputFields / 2,
              ),

              // Remember Me and Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                      ),
                      const Text(TTextStrings.rememberMe)
                    ],
                  ),

                  // Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                      child: const Text(TTextStrings.forgetPassword,)
                  )
                ],
              ),

              const SizedBox(height: TSizes.spaceBetweenItems),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(TTextStrings.signIn)
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenItems),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(TTextStrings.createAccount)
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenItems),
            ]
        ),
      ),
    );
  }
}