import 'package:flutter/material.dart';
import 'package:pawrfecto/common/widgets/image_text/vertical_image_text.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  final List<CategoryItem> items;

  const THomeCategories({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalImageText(
            image: items[index].image,
            title: items[index].title,
            onTap: items[index].onTap,
          );
        },
      ),
    );
  }
}

class CategoryItem {
  final String image;
  final String title;
  final VoidCallback onTap;

  CategoryItem({
    required this.image,
    required this.title,
    required this.onTap,
  });
}