import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/bindings/general_bindings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';
import 'package:pawrfecto/utils/theme/theme.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // Show the Loader while Authentication Repository is deciding to show the Relevant Screen
      home: Scaffold(
        backgroundColor: dark ? TColors.black : TColors.white,
        body: const Center(
          child: CircularProgressIndicator(
            color: TColors.primary,
          )
        )
      ),
    );
  }
}