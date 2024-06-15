import 'package:flutter/material.dart';
import 'package:pawrfecto/features/shop/models/pet_model.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

import 'widgets/pets_appbar.dart';

class PetsScreen extends StatelessWidget {
  // Example list of pets with images
  final List<Pet> pets = [
    Pet(
      name: 'Max',
      description: 'Friendly Labrador Retriever',
      imageUrl: TImageStrings.pet1,
    ),
    Pet(
      name: 'Bella',
      description: 'Playful Persian Cat',
      imageUrl: TImageStrings.pet2,
    ),
    Pet(
      name: 'Charlie',
      description: 'Active Border Collie',
      imageUrl: TImageStrings.pet3,
    ),
    Pet(
      name: 'Luna',
      description: 'Loyal German Shepherd',
      imageUrl: TImageStrings.pet4,
    ),
    Pet(
      name: 'Oliver',
      description: 'Cuddly Ragdoll Cat',
      imageUrl: TImageStrings.pet5,
    ),
    Pet(
      name: 'Lucy',
      description: 'Adorable Beagle',
      imageUrl: TImageStrings.pet6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TPetsAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (context, index) {
            final pet = pets[index];
            return Card(
              color: TColors.primary,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10.0),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(pet.imageUrl),
                ),
                title: Text(
                  pet.name,
                  style: dark
                      ? Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white)
                      : Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                ),
                subtitle: Text(
                  pet.description,
                  style: dark
                      ? Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.grey)
                      : Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.grey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
