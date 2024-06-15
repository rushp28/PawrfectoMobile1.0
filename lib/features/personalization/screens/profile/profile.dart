import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/common/widgets/appbar/appbar.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pawrfecto/common/widgets/texts/section_heading.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularContainer(
                      width: 80,
                      height: 80,
                      padding: 0,
                      child: Image(image: AssetImage(TImageStrings.user)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')
                    ),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBetweenItems),
              
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBetweenItems),

              TProfileMenu(
                  title: 'Name',
                  value: 'Rashmika',
                  onPressed: () {}
              ),
              TProfileMenu(
                  title: 'Username',
                  value: 'hello666',
                  onPressed: () {}
              ),

              const SizedBox(height: TSizes.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBetweenItems),

              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBetweenItems),

              TProfileMenu(
                  title: 'User ID',
                  value: '666',
                  icon: Iconsax.copy,
                  onPressed: () {}
              ),

              TProfileMenu(
                  title: 'Email',
                  value: 'hello@gmail.com',
                  onPressed: () {}
              ),

              TProfileMenu(
                  title: 'Phone Number',
                  value: '055-99558710',
                  onPressed: () {}
              ),

              TProfileMenu(
                  title: 'Gender',
                  value: 'Male',
                  onPressed: () {}
              ),

              TProfileMenu(
                  title: 'Date of Birth',
                  value: '21-07-1972',
                  onPressed: () {}
              ),

              const Divider(),

              const SizedBox(height: TSizes.spaceBetweenItems),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)
                    )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

