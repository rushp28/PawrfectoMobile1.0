import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/features/authentication/controllers/signup/signup_controller.dart';
import 'package:pawrfecto/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Controller
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
        child: Column(
            children: [
              Row(
                children: [
                  // First Name Field
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText(TTextStrings.firstName, value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTextStrings.firstName,
                          prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                  ),

                  const SizedBox(width: TSizes.spaceBetweenInputFields),

                  // Last Name Field
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText(TTextStrings.lastName, value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTextStrings.lastName,
                          prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBetweenInputFields),

              TextFormField(
                controller: controller.username,
                validator: (value) => TValidator.validateEmptyText(TTextStrings.username, value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTextStrings.username,
                    prefixIcon: Icon(Iconsax.user_edit)
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenInputFields),

              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTextStrings.email,
                    prefixIcon: Icon(Iconsax.direct)
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenInputFields),

              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                    labelText: TTextStrings.phoneNo,
                    prefixIcon: Icon(Iconsax.call)
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenInputFields),

              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
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

              const SizedBox(height: TSizes.spaceBetweenSections),

              // Terms and Conditions Checkbox
              const TTermsAndConditionsCheckbox(),

              const SizedBox(height: TSizes.spaceBetweenItems),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(TTextStrings.createAccount)
                ),
              ),
            ]
        )
    );
  }
}

