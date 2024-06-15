import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/loaders/animation_loader.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkContainer : TColors.lightContainer,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                )
              ],
            )
          )
        )
    );
  }

  static void stopLoading() {
    // Close the dialog using the Navigator
    Navigator.of(Get.overlayContext!).pop();
  }
}