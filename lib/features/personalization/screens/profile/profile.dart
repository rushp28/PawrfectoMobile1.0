import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pawrfecto/common/widgets/appbar/appbar.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pawrfecto/common/widgets/texts/section_heading.dart';
import 'package:pawrfecto/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String _profileImageUrl = TImageStrings.user;

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      try {
        // Specify the file path and name on Firebase Storage
        String fileName = 'profile_pictures/${DateTime.now().millisecondsSinceEpoch}.jpg';
        final ref = FirebaseStorage.instance.ref().child(fileName);

        // Upload the file
        await ref.putFile(imageFile);

        // Get the URL of the uploaded file
        String imageUrl = await ref.getDownloadURL();

        setState(() {
          _profileImageUrl = imageUrl;
        });

        // Update the user profile with the new image URL
        // You can save the URL to Firestore or your database here
      } catch (e) {
        // Handle errors
        print('Error uploading image: $e');
      }
    }
  }

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
                    TCircularContainer(
                      width: 80,
                      height: 80,
                      padding: 0,
                      child: Image.network(_profileImageUrl, fit: BoxFit.cover),
                    ),
                    TextButton(
                        onPressed: _pickAndUploadImage,
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
