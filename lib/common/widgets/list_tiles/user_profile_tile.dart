import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularContainer(
        width: 50,
        height: 50,
        padding: 0,
        child: Image(image: AssetImage(TImageStrings.user)),
      ),
      title: Text(
        'Rashmika',
        style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'hello@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}